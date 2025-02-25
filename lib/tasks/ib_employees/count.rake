namespace :ib_employees do
  desc "Count records in both CSV files"
  task count_records: :environment do
    raw_path = Rails.root.join('lib', 'data', 'ib_employees_2_24', 'raw_employees.csv')
    cleaned_path = Rails.root.join('lib', 'data', 'ib_employees_2_24', 'cleaned_employees.csv')
    
    raw_count = CSV.read(raw_path, headers: true).count
    cleaned_count = CSV.read(cleaned_path, headers: true).count
    
    puts "Total records in raw_employees.csv: #{raw_count}"
    puts "Total records in cleaned_employees.csv: #{cleaned_count}"
    puts "Difference: #{raw_count - cleaned_count} records were filtered out"
  end
end 
