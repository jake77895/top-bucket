class EmploymentReportsController < ApplicationController
  def show
    @programs = EmploymentReportProgram.all
    @selected_program = EmploymentReportProgram.find_by(id: params[:id]) || @programs.first
    
    if @selected_program
      @report = @selected_program.employment_reports.find_by(year: params[:year]) || 
                @selected_program.employment_reports.order(year: :desc).first
      
      if @report
        @year = @report.year
        # Validate year is a 4-digit number
        if @year.to_s.length != 4
          redirect_to root_path, alert: "Invalid year format"
          return
        end
        
        @overview = @report.employment_report_overview
        @functions = @report.employment_report_function
        @locations = @report.employment_report_location
        @employers = @report.employment_report_employer

        # Apply filters if any are present
        @filtered_data = apply_filters(params)
      end
    else
      redirect_to root_path, alert: "Program not found"
    end

    # Add this to verify the view is being rendered
    render 'employment_reports/show'

    respond_to do |format|
      format.html
      format.json { render json: @filtered_data }
    end
  end

  private

  def apply_filters(params)
    return default_chart_data unless params[:metric].present?

    programs = EmploymentReportProgram.all
    metric = params[:metric]

    # Debug log to check number of programs
    Rails.logger.debug "Number of programs: #{programs.count}"

    data = case metric
    when 'job_offer_rate'
      programs.map { |p| 
        [p.name, p.employment_reports.last&.employment_report_overview&.job_offers_3_months]
      }
    when 'total_offer_rate'
      programs.map { |p| 
        report = p.employment_reports.last&.employment_report_overview
        total_rate = if report
          (report.seeking_employment * report.job_offers_3_months / 100.0) / report.class_size * 100
        end
        [p.name, total_rate&.round(1)]
      }
    when 'consulting', 'investment_banking'
      programs.map { |p| 
        [p.name, p.employment_reports.last&.employment_report_function&.send(metric)]
      }
    else
      if @functions.attributes.key?(metric)
        programs.map { |p| 
          [p.name, p.employment_reports.last&.employment_report_function&.send(metric)]
        }
      elsif @locations.attributes.key?(metric)
        programs.map { |p| 
          [p.name, p.employment_reports.last&.employment_report_location&.send(metric)]
        }
      end
    end

    # Ensure data is not nil and has values
    data = data.compact.reject { |_, value| value.nil? }
    
    # Debug log to check filtered data
    Rails.logger.debug "Filtered data: #{data.inspect}"

    # Calculate average only if we have data
    values = data.map { |_, value| value }
    average = values.any? ? (values.sum / values.length.to_f).round(1) : nil

    # Debug log for average
    Rails.logger.debug "Average: #{average}"

    {
      labels: data.map { |name, _| name },
      datasets: [
        {
          label: metric.titleize,
          data: data.map { |_, value| value },
          backgroundColor: '#4285f4',  # Google Blue
          borderColor: '#4285f4',
          borderWidth: 1
        },
        {
          label: 'Average',
          data: Array.new(data.length, average),
          type: 'line',
          borderColor: '#dc3545',      # Bootstrap danger red
          backgroundColor: '#dc3545',
          borderWidth: 2,
          pointRadius: 0,
          borderDash: [5, 5],
          fill: false,
          order: 1  # Ensure line appears on top
        }
      ]
    }
  end

  def default_chart_data
    programs = EmploymentReportProgram.all
    data = programs.map { |p| 
      [p.name, p.employment_reports.last&.employment_report_overview&.job_offers_3_months]
    }.compact.reject { |_, value| value.nil? }
    
    values = data.map { |_, value| value }
    average = values.any? ? (values.sum / values.length.to_f).round(1) : nil

    {
      labels: data.map { |name, _| name },
      datasets: [
        {
          label: 'Job Offer Rate',
          data: data.map { |_, value| value },
          backgroundColor: '#4285f4',
          borderColor: '#4285f4',
          borderWidth: 1
        },
        {
          label: 'Average',
          data: Array.new(data.length, average),
          type: 'line',
          borderColor: '#dc3545',
          backgroundColor: '#dc3545',
          borderWidth: 2,
          pointRadius: 0,
          borderDash: [5, 5],
          fill: false,
          order: 1
        }
      ]
    }
  end
end 
