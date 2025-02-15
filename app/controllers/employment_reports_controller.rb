class EmploymentReportsController < ApplicationController
  def show
    @year = params[:year]
    puts "DEBUG: Hitting employment_reports#show with year: #{@year}"  # Debug line
    
    # Optional: Add validation for year format/existence
    unless @year.match?(/^\d{4}$/)
      redirect_to root_path, alert: "Invalid year format"
      return
    end

    # Add this to verify the view is being rendered
    render 'employment_reports/show'
  end
end 
