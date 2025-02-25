# lib/tasks/ib_employees/import.rake
require 'csv'
require 'open-uri'

namespace :ib_employees do
  desc "Import all IB employees"
  task import_all: :environment do
    csv_path = Rails.root.join('lib', 'data', 'ib_employees_2_24', 'cleaned_employees.csv')
    puts "Reading from: #{csv_path}"
    
    count = 0
    errors = []
    total_records = CSV.read(csv_path, headers: true).count
    
    CSV.foreach(csv_path, headers: true) do |row|
      begin
        # Convert '0' or nil to nil for foreign keys
        job_level_id = row['job_level_id'].to_i
        job_level_id = nil if job_level_id == 0

        location_id = row['location_id'].to_i
        location_id = nil if location_id == 0

        employee = Employee.new(
          name: row['name'],
          linkedin_url: row['linkedin_url'],
          company_id: row['company_id'].to_i,
          job_level_id: job_level_id,
          location_id: location_id,
          position_type_id: row['position_type_id'].to_i,
          other_info: row['other_info']
        )

        # Handle remote image
        if row['picture'].present?
          begin
            employee.remote_picture_url = row['picture']
          rescue OpenURI::HTTPError => e
            puts "Warning: Could not download image for #{row['name']}: #{e.message}"
          end
        end

        employee.save!
        
        count += 1
        puts "Imported #{count}/#{total_records}: #{row['name']}"
      rescue => e
        errors << "Error importing #{row['name']}: #{e.message}"
      end
    end
    
    puts "\nImport completed:"
    puts "Successfully imported #{count} out of #{total_records} records"
    
    if errors.any?
      puts "\nErrors encountered:"
      errors.each { |error| puts error }
    end
  end
end
