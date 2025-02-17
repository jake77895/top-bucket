class CareerDataController < ApplicationController
  include CareerDataShared

  # def show

  # end

  # def overview
  #   # Remove empty filter values from params[:q]
  #   puts "Filter Parameters (params[:q]): #{params[:q].inspect}"
  #   clean_params = params[:q]&.reject { |_key, value| value.blank? }
  #   puts "Filter Parameters: #{clean_params.inspect}" # Debugging line

    

  
  #   # Initialize Ransack search object with cleaned parameters
  #   @q = CombinedJob.ransack(clean_params)
  
  #   # Apply filtering
  #   @filtered_jobs = @q.result
  
  #   # Perform aggregation queries
  #   aggregate_data = @filtered_jobs.select(
  #     "SUM(average_salary * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_salary",
  #     "SUM(average_bonus * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_bonus",
  #     "SUM((average_salary + average_bonus) * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_total_comp",
  #     "SUM(average_hours_worked_per_week * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_hours_worked",
  #     "SUM(sample_size) AS total_records"
  #   ).take
  
  #   # Build the summary hash
  #   @summary = {
  #     avg_salary: aggregate_data.avg_salary.to_f,
  #     avg_bonus: aggregate_data.avg_bonus.to_f,
  #     avg_total_comp: aggregate_data.avg_total_comp.to_f,
  #     avg_hours_worked: aggregate_data.avg_hours_worked.to_f,
  #     total_records: aggregate_data.total_records.to_i
  #   }
  
  #   # Calculate average compensation per hour
  #   if @summary[:avg_hours_worked] > 0
  #     annual_hours = @summary[:avg_hours_worked] * 48 # Multiply avg hours worked by 48 weeks
  #     @avg_comp_per_hour = (@summary[:avg_total_comp] / annual_hours).round(0)
  #   else
  #     @avg_comp_per_hour = 0
  #   end
  # end
  
  



  # def change
  
  #   # Permit parameters
  #   clean_params = params.permit(
  #     :q_from_industry_cont, :q_from_company_cont, :q_from_level_cont, :q_from_sub_level_cont,
  #     :q_to_industry_cont, :q_to_company_cont, :q_to_level_cont, :q_to_sub_level_cont
  #   )
  
  #   # Map to Ransack filters
  #   @q_from = CombinedJob.ransack(
  #     industry_cont: clean_params[:q_from_industry_cont],
  #     company_cont: clean_params[:q_from_company_cont],
  #     level_cont: clean_params[:q_from_level_cont],
  #     sub_level_cont: clean_params[:q_from_sub_level_cont]
  #   )
  
  #   @q_to = CombinedJob.ransack(
  #     industry_cont: clean_params[:q_to_industry_cont],
  #     company_cont: clean_params[:q_to_company_cont],
  #     level_cont: clean_params[:q_to_level_cont],
  #     sub_level_cont: clean_params[:q_to_sub_level_cont]
  #   )
  
  #   @from_jobs = @q_from.result
  #   @to_jobs = @q_to.result
  
  #   # Calculate change summary
  #   @change_summary = if @from_jobs.exists? && @to_jobs.exists?
  #     calculate_change_summary(@from_jobs, @to_jobs)
  #   else
  #     {
  #       salary_change: 0.0,
  #       bonus_change: 0.0,
  #       total_comp_change: 0.0,
  #       hours_worked_change: 0.0,
  #       comp_per_hour_change: 0.0,
  #       salary_percent_change: 0.0,
  #       bonus_percent_change: 0.0,
  #       total_comp_percent_change: 0.0,
  #       comp_per_hour_percent_change: 0.0
  #     }
  #   end

  # end
  
  
  

  
  

  # def start
  #   Rails.logger.debug "Raw Params Received: #{params.inspect}"
  
  #   # Clean and permit parameters
  #   filter_params = params[:q]&.reject { |_key, value| value.blank? }
  #   Rails.logger.debug "Filtered Params: #{filter_params.inspect}"
  
  #   # Initialize Ransack search object
  #   @q = CombinedJob.ransack(filter_params)
  #   @filtered_jobs = @q.result(distinct: true)
  
  #   Rails.logger.debug "Ransack SQL Query: #{@filtered_jobs.to_sql}"
  
  #   # If an industry or company is selected, limit the results
  #   selected_industry = filter_params&.dig("to_industry_cont")
  #   selected_company = filter_params&.dig("to_company_cont")
  
  #   # Filter industries and companies
  #   filtered_jobs = @filtered_jobs
  #   filtered_jobs = filtered_jobs.where(industry: selected_industry) if selected_industry.present?
  #   filtered_jobs = filtered_jobs.where(company: selected_company) if selected_company.present?
  
  #   # Aggregate industries
  #   @industries = filtered_jobs
  #                 .select(
  #                   "industry, SUM(sample_size) AS total_records, 
  #                   SUM(average_salary * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_salary, 
  #                   SUM(average_bonus * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_bonus, 
  #                   SUM(average_hours_worked_per_week * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_hours, 
  #                   SUM((average_salary + average_bonus) * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_total_comp, 
  #                   SUM((average_salary + average_bonus) * sample_size) / NULLIF(SUM(sample_size * average_hours_worked_per_week), 0) AS avg_comp_hour"
  #                 )
  #                 .group(:industry)
  #                 .order("total_records DESC")
  #                 .limit(10)
  
  #   # Aggregate companies
  #   @companies = filtered_jobs
  #                 .select(
  #                   "company, SUM(sample_size) AS total_records, 
  #                   SUM(average_salary * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_salary, 
  #                   SUM(average_bonus * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_bonus, 
  #                   SUM(average_hours_worked_per_week * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_hours, 
  #                   SUM((average_salary + average_bonus) * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_total_comp, 
  #                   SUM((average_salary + average_bonus) * sample_size) / NULLIF(SUM(sample_size * average_hours_worked_per_week), 0) AS avg_comp_hour"
  #                 )
  #                 .group(:company)
  #                 .order("total_records DESC")
  #                 .limit(10)
  
  #   # Calculate summary data for all filtered jobs
  #   @start_summary = calculate_start_summary(filtered_jobs)
  # end
  
  
  
  
  # def nodes_data
  #   number_of_weeks_worked = 48
  
  #   # Constants for spacing
  #   industry_spacing = 200 # Horizontal spacing between industries
  #   level_spacing = 100    # Vertical spacing between levels
  
  #   # Create a hash to store aggregated node data
  #   node_aggregates = node_mapping.map.with_index do |node, industry_index|
  #     {
  #       id: node[:id],
  #       name: node[:names].first, # Use the first name as the node's main name
  #       level: node[:level],
  #       industry: node[:industry],
  #       x: industry_index * industry_spacing, # Calculate x-coordinate based on industry index
  #       y: (node[:level] - 1) * level_spacing, # Calculate y-coordinate based on level
  #       salary: 0.0,
  #       bonus: 0.0,
  #       total_comp: 0.0,
  #       hours_per_week: 0.0,
  #       comp_per_hour: 0.0,
  #       record_count: 0
  #     }
  #   end
  
  #   # Fetch and aggregate compensation data from the CombinedJob view
  #   compensations = CombinedJob
  #     .group(:industry, :level)
  #     .select(
  #       "industry",
  #       "level",
  #       "SUM(average_salary * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_salary",
  #       "SUM(average_bonus * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_bonus",
  #       "SUM(average_hours_worked_per_week * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_hours_worked_per_week",
  #       "SUM(sample_size) AS record_count"
  #     )
  
  #   # Map aggregated data back to nodes
  #   compensations.each do |compensation|
  #     node = node_mapping.find do |node|
  #       node[:industry].strip.downcase == compensation.industry.strip.downcase &&
  #         node[:names].map(&:downcase).include?(compensation.level.strip.downcase)
  #     end
  
  #     next unless node
  
  #     # Find the corresponding node aggregate
  #     aggregate = node_aggregates.find { |n| n[:id] == node[:id] }
  #     next unless aggregate
  
  #     # Update node data with aggregated values
  #     aggregate[:salary] = compensation.avg_salary.to_f.round(2)
  #     aggregate[:bonus] = compensation.avg_bonus.to_f.round(2)
  #     aggregate[:total_comp] = (compensation.avg_salary.to_f + compensation.avg_bonus.to_f).round(2)
  #     aggregate[:hours_per_week] = compensation.avg_hours_worked_per_week.to_f.round(2)
  #     aggregate[:comp_per_hour] = ((compensation.avg_salary.to_f + compensation.avg_bonus.to_f) /
  #                                  (compensation.avg_hours_worked_per_week.to_f * number_of_weeks_worked).nonzero? || 1).round(2)
  #     aggregate[:record_count] = compensation.record_count
  #   end
  
  #   # Return the final node aggregates as JSON
  #   render json: node_aggregates
  # end
  

  # def generate_exit_opportunities
  #   # Get all non-null job_grouping values.
  #   grouping_ids = CareerJob.where("job_grouping IS NOT NULL")
  #                           .group(:job_grouping)
  #                           .pluck(:job_grouping)
    
  #   # Get a list of industries from the static node mapping.
  #   industries = node_mapping.map { |nm| nm[:industry].strip }.uniq
    
  #   # Initialize the dynamic mapping hash.
  #   # The keys will be each industry (from the node mapping) and the values
  #   # will be arrays of exit opportunity objects.
  #   dynamic_mapping = Hash.new { |hash, key| hash[key] = [] }
    
  #   # Process each job grouping.
  #   grouping_ids.each do |grouping_id|
  #     jobs = CareerJob.where(job_grouping: grouping_id)
  #     next if jobs.empty?
      
  #     # For each industry in our base list...
  #     industries.each do |industry|
  #       # Get all jobs in this grouping that belong to this industry.
  #       industry_jobs = jobs.select { |job| job.industry.strip.downcase == industry.strip.downcase }
  #       next if industry_jobs.empty?  # No jobs for this industry in the grouping
        
  #       # Determine a threshold for this industry.
  #       # (For example, use the maximum job_order among these jobs.)
  #       threshold = industry_jobs.map { |j| j.job_order.to_i }.max
        
  #       # Now, consider jobs in the grouping from other industries whose job_order is lower than the threshold.
  #       exit_jobs = jobs.select do |job|
  #         job.industry.strip.downcase != industry.strip.downcase &&
  #         job.job_order.to_i < threshold
  #       end
        
  #       exit_jobs.each do |exit_job|
  #         # Look up the corresponding compensation to determine the job's level.
  #         comp = CareerCompensation.find_by(career_job_id: exit_job.id)
  #         next unless comp
          
  #         # Normalize the compensation level string.
  #         comp_level_normalized = comp.level.to_s.strip.downcase
          
  #         # Look up the node mapping for the exit job's industry based on its level (via names).
  #         mapping = node_mapping.find do |nm|
  #           nm[:industry].strip.downcase == exit_job.industry.strip.downcase &&
  #           nm[:names].any? { |name| name.strip.downcase == comp_level_normalized }
  #         end
          
  #         if mapping
  #           # Build the exit opportunity object.
  #           exit_opportunity = { 
  #             exit_industry: exit_job.industry,  # the industry of the exit job
  #             node_id: mapping[:id],              # the matching node mapping's id
  #             job_level: comp.level,              # the compensation level (as stored in career_compensation)
  #             job_order: exit_job.job_order         # the job_order from the career_job record
  #           }
  #           # Add this opportunity to the array for the current industry.
  #           dynamic_mapping[industry] << exit_opportunity unless dynamic_mapping[industry].include?(exit_opportunity)
  #         end
  #       end
  #     end
  #   end
    
  #   render json: dynamic_mapping
  # end
  
  
  
  

  # def link_data
  #   # Step 1: Fetch and build standard job order links
  #   grouped_jobs = CareerJob
  #     .joins(:career_compensations)
  #     .select(
  #       "career_jobs.id",
  #       "career_jobs.job_grouping",
  #       "career_jobs.job_order",
  #       "career_jobs.industry",
  #       "career_compensations.level AS level"
  #     )
  #     .where.not(job_grouping: nil, job_order: nil) # Ensure valid grouping and order
  #     .order(:job_grouping, :job_order)            # Sort by grouping and job order
  
  #   # Remove duplicate jobs within the same grouping
  #   unique_jobs = grouped_jobs.uniq { |job| [job.id, job.job_grouping, job.job_order] }
  
  #   # Debug grouped jobs
  #   Rails.logger.debug "Grouped Jobs: #{unique_jobs.map { |job| { id: job.id, industry: job.industry, level: job.level, order: job.job_order } }}"
  
  #   # Build job order links
  #   job_to_node_mapping = {}
  #   node_mapping.each do |node|
  #     node[:names].each do |name|
  #       job_to_node_mapping[[node[:industry].strip.downcase, name.strip.downcase]] = node
  #     end
  #   end
  
  #   # Debug job-to-node mapping keys
  #   Rails.logger.debug "Job to Node Mapping Keys: #{job_to_node_mapping.keys}"
  
  #   # Build standard links based on job order
  #   standard_links = unique_jobs.group_by(&:job_grouping).flat_map do |_grouping, jobs|
  #     jobs.each_cons(2).filter_map do |to_job, from_job| # Flip order for `to_job` -> `from_job`
  #       next if to_job.job_order >= from_job.job_order
  
  #       source_node = job_to_node_mapping[[from_job.industry.strip.downcase, from_job.level.strip.downcase]]
  #       target_node = job_to_node_mapping[[to_job.industry.strip.downcase, to_job.level.strip.downcase]]
  
  #       next unless source_node && target_node
  
  #       # Ensure no duplicate links and order nodes correctly
  #       {
  #         source: source_node[:id],
  #         target: target_node[:id],
  #         source_industry: source_node[:industry],
  #         source_level: source_node[:names].first,
  #         target_industry: target_node[:industry],
  #         target_level: target_node[:names].first,
  #         **calculate_link_data(to_job, from_job) # Add calculated link differences
  #       }
  #     end
  #   end
  
  #   # Step 2: Generate level change links
  #   level_change_links = generate_level_change_links
  
  #   # Combine all links
  #   combined_links = standard_links + level_change_links
  
  #   # Step 3: Aggregate links based on source and target node IDs
  #   aggregated_links = aggregate_links(combined_links, node_mapping)
  
  #   # Step 4: Return aggregated links as JSON
  #   render json: aggregated_links
  # end
  
  
  
  
  
  
  
  
  
  
  
  
  
  # # Helper method to calculate link-specific data
  # def calculate_link_data(to_job, from_job)
  #   number_of_weeks_worked = 48

  #   # Fetch compensation data for source and target jobs
  #   career_compensations = CareerCompensation
  #     .where(career_job_id: [to_job.id, from_job.id])
  #     .group(:career_job_id)
  #     .select(
  #       :career_job_id,
  #       "AVG(salary) AS avg_salary",
  #       "AVG(bonus) AS avg_bonus",
  #       "AVG(hours_worked_per_week) AS avg_hours_worked_per_week"
  #     )

  #   # Extract data for the source and target jobs
  #   source_data = career_compensations.find { |c| c.career_job_id == from_job.id } || {}
  #   target_data = career_compensations.find { |c| c.career_job_id == to_job.id } || {}

  #   # Compute differences (target - source)
  #   salary_diff = target_data[:avg_salary].to_f - source_data[:avg_salary].to_f
  #   bonus_diff = target_data[:avg_bonus].to_f - source_data[:avg_bonus].to_f

  #   # Calculate compensation per hour based on hours worked and weeks worked
  #   source_hours = (source_data[:avg_hours_worked_per_week].to_f * number_of_weeks_worked).nonzero? || 1
  #   target_hours = (target_data[:avg_hours_worked_per_week].to_f * number_of_weeks_worked).nonzero? || 1

  #   source_comp_per_hour = (source_data[:avg_salary].to_f + source_data[:avg_bonus].to_f) / source_hours
  #   target_comp_per_hour = (target_data[:avg_salary].to_f + target_data[:avg_bonus].to_f) / target_hours

  #   comp_per_hour_diff = target_comp_per_hour - source_comp_per_hour

  #   # Calculate the difference in hours worked per week
  #   hours_worked_diff = target_data[:avg_hours_worked_per_week].to_f - source_data[:avg_hours_worked_per_week].to_f

  #   {
  #     salary_diff: salary_diff.round(2),
  #     bonus_diff: bonus_diff.round(2),
  #     total_comp_diff: (salary_diff + bonus_diff).round(2),
  #     comp_per_hour_diff: comp_per_hour_diff.round(2),
  #     hours_worked_diff: hours_worked_diff.round(2) # Add this to the output
  #   }
  # end


  # def aggregate_links(links, node_mapping)
  #   grouped_links = links.group_by { |link| [link[:source], link[:target]] }
  
  #   grouped_links.map do |(source, target), grouped|
  #     count = grouped.size
  #     {
  #       source: source,
  #       target: target,
  #       source_industry: grouped.first[:source_industry],
  #       source_level: grouped.first[:source_level],
  #       target_industry: grouped.first[:target_industry],
  #       target_level: grouped.first[:target_level],
  #       avg_salary_diff: (grouped.sum { |l| l[:salary_diff] } / count).round(2),
  #       avg_bonus_diff: (grouped.sum { |l| l[:bonus_diff] } / count).round(2),
  #       avg_total_comp_diff: (grouped.sum { |l| l[:total_comp_diff] } / count).round(2),
  #       avg_comp_per_hour_diff: (grouped.sum { |l| l[:comp_per_hour_diff] } / count).round(2),
  #       avg_hours_worked_diff: (grouped.sum { |l| l[:hours_worked_diff] } / count).round(2) # Include avg hours worked difference
  #     }
  #   end
  # end

  # def generate_level_change_links
  #   number_of_weeks_worked = 48
  
  #   # Step 1: Fetch career compensations grouped by career_job_id
  #   grouped_compensations = CareerCompensation
  #     .joins(:career_job) # Join to get the industry from career jobs
  #     .select(
  #       "career_compensations.career_job_id",
  #       "career_jobs.industry AS industry",
  #       "career_compensations.level",
  #       "AVG(career_compensations.salary) AS avg_salary",
  #       "AVG(career_compensations.bonus) AS avg_bonus",
  #       "AVG(career_compensations.hours_worked_per_week) AS avg_hours_worked_per_week"
  #     )
  #     .group("career_compensations.career_job_id", "career_jobs.industry", "career_compensations.level")
  #     .order("career_compensations.career_job_id", "career_compensations.level") # Ensure proper ordering by level
  
  #   # Step 2: Group compensations by career_job_id
  #   links = grouped_compensations.group_by(&:career_job_id).flat_map do |_job_id, records|
  #     # Generate links for consecutive levels
  #     records.each_cons(2).map do |from_record, to_record|
  #       # Map source and target nodes using their levels and industries
  #       source_node = node_mapping.find do |node|
  #         node[:industry].strip.downcase == from_record.industry.strip.downcase &&
  #           node[:names].include?(from_record.level.strip.downcase)
  #       end
  
  #       target_node = node_mapping.find do |node|
  #         node[:industry].strip.downcase == to_record.industry.strip.downcase &&
  #           node[:names].include?(to_record.level.strip.downcase)
  #       end
  
  #       next unless source_node && target_node # Skip if nodes can't be mapped
  
  #       # Ensure source node has a lower ID and target node has a higher ID
  #       if source_node[:id] > target_node[:id]
  #         source_node, target_node = target_node, source_node
  #       end
  
  #       # Calculate differences
  #       salary_diff = to_record.avg_salary.to_f - from_record.avg_salary.to_f
  #       bonus_diff = to_record.avg_bonus.to_f - from_record.avg_bonus.to_f
  
  #       # Calculate compensation per hour differences
  #       source_hours = (from_record.avg_hours_worked_per_week.to_f * number_of_weeks_worked).nonzero? || 1
  #       target_hours = (to_record.avg_hours_worked_per_week.to_f * number_of_weeks_worked).nonzero? || 1
  
  #       source_comp_per_hour = (from_record.avg_salary.to_f + from_record.avg_bonus.to_f) / source_hours
  #       target_comp_per_hour = (to_record.avg_salary.to_f + to_record.avg_bonus.to_f) / target_hours
  
  #       comp_per_hour_diff = target_comp_per_hour - source_comp_per_hour
  #       hours_worked_diff = to_record.avg_hours_worked_per_week.to_f - from_record.avg_hours_worked_per_week.to_f
  
  #       # Build link data
  #       {
  #         source: source_node[:id],
  #         source_industry: source_node[:industry],
  #         source_level: source_node[:names].first,
  #         target: target_node[:id],
  #         target_industry: target_node[:industry],
  #         target_level: target_node[:names].first,
  #         salary_diff: salary_diff.round(2),
  #         bonus_diff: bonus_diff.round(2),
  #         total_comp_diff: (salary_diff + bonus_diff).round(2),
  #         comp_per_hour_diff: comp_per_hour_diff.round(2),
  #         hours_worked_diff: hours_worked_diff.round(2)
  #       }
  #     end
  #   end.compact
  
  #   links
  # end
  
  

  # def exit_opportunities_mapping
  #   exit_opps = ExitOpportunityMapping.all.group_by(&:source_category)
    
  #   mapped_exits = exit_opps.transform_values do |opportunities|
  #     opportunities.map do |opp|
  #       # Find the matching node from node_mapping
  #       mapping = node_mapping.find do |nm|
  #         nm[:industry] == opp.target_industry &&
  #         nm[:names].any? { |name| name.strip.downcase == opp.target_node_name.strip.downcase }
  #       end
        
  #       if mapping
  #         {
  #           node_id: mapping[:id],
  #           likelihood: opp.likelihood
  #         }
  #       end
  #     end.compact
  #   end
    
  #   Rails.logger.debug "Exit Opportunities Mapping: #{mapped_exits.inspect}"
  #   render json: mapped_exits
  # end
  
  

  # def node_data
  #   # Fetch exit opportunity mappings for this node
  #   @mappings = ExitOpportunityMapping.includes(:exit_opportunity_details)
  #                                    .where(target_node_name: params[:node_name])
  #                                    .order(likelihood: :asc)

  #   # Build response data
  #   {
  #     industry: node[:industry],
  #     level: node[:level],
  #     record_count: summary[:total_records],
  #     avg_salary: summary[:avg_salary],
  #     avg_bonus: summary[:avg_bonus],
  #     avg_total_comp: summary[:avg_total_comp],
  #     avg_comp_per_hour: summary[:avg_comp_per_hour],
  #     mappings: @mappings.as_json(include: :exit_opportunity_details)
  #   }
  # end



  private

  # def node_mapping
  #   [
  #     # Hedge Fund (now first)
  #     { id: 11, names: ["Junior Analyst"], level: 1, industry: "Hedge Fund" },
  #     { id: 12, names: ["Research Associate"], level: 2, industry: "Hedge Fund" },
  #     { id: 13, names: ["Fund Analyst"], level: 3, industry: "Hedge Fund" },
  #     { id: 14, names: ["Sector Head"], level: 4, industry: "Hedge Fund" },
  #     { id: 15, names: ["Portfolio Manager"], level: 5, industry: "Hedge Fund" },

  #     # Venture Capital
  #     { id: 1, names: ["Analyst"], level: 1, industry: "Venture Capital" },
  #     { id: 2, names: ["Pre-MBA associate"], level: 2, industry: "Venture Capital" },
  #     { id: 3, names: ["Senior associate"], level: 3, industry: "Venture Capital" },
  #     { id: 4, names: ["Principal"], level: 4, industry: "Venture Capital" },
  #     { id: 5, names: ["Partner"], level: 5, industry: "Venture Capital" },

  #     # Private Credit
  #     { id: 41, names: ["Analyst"], level: 1, industry: "Private Credit" },
  #     { id: 42, names: ["Associate"], level: 2, industry: "Private Credit" },
  #     { id: 43, names: ["Vice president"], level: 3, industry: "Private Credit" },
  #     { id: 44, names: ["Principal"], level: 4, industry: "Private Credit" },
  #     { id: 45, names: ["Partner"], level: 5, industry: "Private Credit" },

  #     # Private Equity
  #     { id: 6, names: ["Analyst"], level: 1, industry: "Private Equity" },
  #     { id: 7, names: ["Associate"], level: 2, industry: "Private Equity" },
  #     { id: 8, names: ["Vice president"], level: 3, industry: "Private Equity" },
  #     { id: 9, names: ["Principal"], level: 4, industry: "Private Equity" },
  #     { id: 10, names: ["Partner"], level: 5, industry: "Private Equity" },

  #     # Investment Banking
  #     { id: 16, names: ["Analyst"], level: 1, industry: "Investment Banking" },
  #     { id: 17, names: ["Associate"], level: 2, industry: "Investment Banking" },
  #     { id: 18, names: ["Vice president"], level: 3, industry: "Investment Banking" },
  #     { id: 19, names: ["Senior vice president","Executive Director"], level: 4, industry: "Investment Banking" },
  #     { id: 20, names: ["Managing director"], level: 5, industry: "Investment Banking" },
  
  #     # Corporate Development
  #     { id: 21, names: ["Analyst"], level: 1, industry: "Corporate Development" },
  #     { id: 22, names: ["Associate"], level: 2, industry: "Corporate Development" },
  #     { id: 23, names: ["Manager"], level: 3, industry: "Corporate Development" },
  #     { id: 24, names: ["Director"], level: 4, industry: "Corporate Development" },
  #     { id: 25, names: ["Vice president"], level: 5, industry: "Corporate Development" },
  
  #     # Investment Management
  #     { id: 26, names: ["Analyst"], level: 1, industry: "Investment Management" },
  #     { id: 27, names: ["Associate"], level: 2, industry: "Investment Management" },
  #     { id: 28, names: ["Senior Associate"], level: 3, industry: "Investment Management" },
  #     { id: 29, names: ["Portfolio Manager"], level: 4, industry: "Investment Management" },
  #     { id: 30, names: ["Director"], level: 5, industry: "Investment Management" },
  
  #     # FP&A
  #     { id: 31, names: ["Analyst"], level: 1, industry: "FP&A" },
  #     { id: 32, names: ["Senior Analyst"], level: 2, industry: "FP&A" },
  #     { id: 33, names: ["Manager"], level: 3, industry: "FP&A" },
  #     { id: 34, names: ["Director"], level: 4, industry: "FP&A" },
  #     { id: 35, names: ["Vice president"], level: 5, industry: "FP&A" },
  
  #     # Other
  #     { id: 36, names: ["Entry Level"], level: 1, industry: "Other" },
  #     { id: 37, names: ["Mid Level"], level: 2, industry: "Other" },
  #     { id: 38, names: ["Senior Level"], level: 3, industry: "Other" },
  #     { id: 39, names: ["Lead"], level: 4, industry: "Other" },
  #     { id: 40, names: ["Executive"], level: 5, industry: "Other" },
  #   ]
  # end

#   def calculate_change_summary(from_jobs, to_jobs)
#     from_avg_salary = from_jobs.average(:average_salary).to_f || 0.0
#     to_avg_salary = to_jobs.average(:average_salary).to_f || 0.0

#     from_avg_bonus = from_jobs.average(:average_bonus).to_f || 0.0
#     to_avg_bonus = to_jobs.average(:average_bonus).to_f || 0.0

#     from_avg_total_comp = (from_avg_salary + from_avg_bonus) || 0.0
#     to_avg_total_comp = (to_avg_salary + to_avg_bonus) || 0.0

#     from_avg_hours = from_jobs.average(:average_hours_worked_per_week).to_f || 0.0
#     to_avg_hours = to_jobs.average(:average_hours_worked_per_week).to_f || 0.0

#     {
#       salary_change: ((to_avg_salary - from_avg_salary) || 0.0).round,
#       salary_percent_change: (percent_change(from_avg_salary, to_avg_salary) || 0.0).round(2),
#       bonus_change: ((to_avg_bonus - from_avg_bonus) || 0.0).round,
#       bonus_percent_change: (percent_change(from_avg_bonus, to_avg_bonus) || 0.0).round(2),
#       total_comp_change: ((to_avg_total_comp - from_avg_total_comp) || 0.0).round,
#       total_comp_percent_change: (percent_change(from_avg_total_comp, to_avg_total_comp) || 0.0).round(2),
#       hours_worked_change: ((to_avg_hours - from_avg_hours) || 0.0).round,
#       comp_per_hour_change: (compensation_per_hour_change(from_avg_total_comp, to_avg_total_comp, from_avg_hours, to_avg_hours) || 0.0).round(2),
#       comp_per_hour_percent_change: (percent_change(from_avg_total_comp / (from_avg_hours.nonzero? || 1), to_avg_total_comp / (to_avg_hours.nonzero? || 1)) || 0.0).round(2)
#     }
# end

  
#   def percent_change(from, to)
#     return 0 if from.zero?
#     ((to - from) / from * 100).round(2)
#   end
  
#   def compensation_per_hour_change(from_total_comp, to_total_comp, from_hours, to_hours)
#     from_per_hour = from_total_comp / (from_hours.nonzero? || 1)
#     to_per_hour = to_total_comp / (to_hours.nonzero? || 1)
#     (to_per_hour - from_per_hour).round(2)
#   end

# def calculate_start_summary(jobs)
#   # Perform aggregation query using SUM(sample_size) for total_records
#   aggregate_data = jobs.select(
#     "SUM(average_salary * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_salary",
#     "SUM(average_bonus * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_bonus",
#     "SUM((average_salary + average_bonus) * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_total_comp",
#     "SUM(average_hours_worked_per_week * sample_size) / NULLIF(SUM(sample_size), 0) AS avg_hours_worked",
#     "SUM(sample_size) AS total_records"
#   ).take

#   # Calculate average compensation per hour based on 48 weeks per year
#   if aggregate_data.avg_hours_worked.to_f > 0
#     annual_hours = aggregate_data.avg_hours_worked.to_f * 48
#     avg_comp_per_hour = (aggregate_data.avg_total_comp.to_f / annual_hours).round
#   else
#     avg_comp_per_hour = 0
#   end

#   # Build the summary hash using aggregated data
#   {
#     avg_salary: aggregate_data.avg_salary.to_f.round,
#     avg_bonus: aggregate_data.avg_bonus.to_f.round,
#     avg_total_comp: aggregate_data.avg_total_comp.to_f.round,
#     avg_hours_worked: aggregate_data.avg_hours_worked.to_f.round,
#     avg_comp_per_hour: avg_comp_per_hour,
#     total_records: aggregate_data.total_records.to_i
#   }
# end

  


  
  

end
