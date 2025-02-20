class EmploymentReportsController < ApplicationController
  def show
    @programs = EmploymentReportProgram.all
    @year = params[:year] || Time.current.year.to_s
    
    # Debug logging
    Rails.logger.debug "Requested Year: #{@year}"
    Rails.logger.debug "Program ID: #{params[:id]}"
    Rails.logger.debug "Total programs: #{@programs.count}"
    Rails.logger.debug "MBA programs: #{@programs.where(program_type: 'MBA').count}"
    Rails.logger.debug "Undergrad programs: #{@programs.where(program_type: 'Undergrad').count}"
    
    # Select program based on params[:id] or default to first
    @selected_program = if params[:id].present?
      @programs.find_by(id: params[:id])
    else
      @programs.first
    end
    
    if @selected_program
      @report = @selected_program.employment_reports.find_by(year: @year) || 
                @selected_program.employment_reports.order(year: :desc).first
      
      if @report
        # Validate year is a 4-digit number
        if @year.to_s.length != 4
          redirect_to root_path, alert: "Invalid year format"
          return
        end
        
        @overview = @report.employment_report_overview
        @industries = @report.employment_report_industry
        @locations = @report.employment_report_location
        @employers = @report.employment_report_employer

        # Apply filters if any are present
        @filtered_data = apply_filters(params)
      else
        redirect_to root_path, alert: "Report not found for year #{@year}"
        return
      end
    else
      redirect_to root_path, alert: "No programs found"
      return
    end

    respond_to do |format|
      format.html
      format.json { render json: @filtered_data }
    end
  rescue => e
    Rails.logger.error "Employment Report Error: #{e.message}\n#{e.backtrace.join("\n")}"
    redirect_to root_path, alert: "Sorry, there was an error loading the employment report."
  end

  private

  def apply_filters(params)
    return default_chart_data unless params[:metric].present?

    programs = EmploymentReportProgram.all
    metric = params[:metric]

    data = case metric
    when 'consulting', 'investment_banking', 'diversified_financial', 
         'investment_management', 'private_equity', 'venture_capital', 
         'marketing', 'technology'
      programs.map { |p| 
        [p.name, p.employment_reports.last&.employment_report_industry&.send(metric)]
      }
    when 'job_offer_rate'
      programs.map { |p|
        [p.name, p.employment_reports.last&.employment_report_overview&.job_offers_3_months]
      }
    when 'total_offer_rate'
      programs.map { |p|
        overview = p.employment_reports.last&.employment_report_overview
        if overview
          total_rate = ((overview.seeking_employment * overview.job_offers_3_months / 100.0) / overview.class_size * 100).round(1)
          [p.name, total_rate]
        end
      }
    when 'average_salary'
      programs.map { |p|
        [p.name, p.employment_reports.last&.employment_report_overview&.average_salary]
      }
    else # Handle location metrics
      programs.map { |p|
        [p.name, p.employment_reports.last&.employment_report_location&.send(metric)]
      }
    end

    # Ensure data is not nil and has values
    data = data.compact.reject { |_, value| value.nil? }
    
    values = data.map { |_, value| value }
    average = values.any? ? (values.sum / values.length.to_f).round(1) : nil

    {
      labels: data.map { |name, _| name },
      datasets: [
        {
          label: metric.titleize.gsub('_', ' '),
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
