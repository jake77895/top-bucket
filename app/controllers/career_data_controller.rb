class CareerDataController < ApplicationController
  def show

  end

  def overview
    

  end

  def change
    @partial = params[:partial] || "change_from_table" # Default partial
  end

  def start
    # @partial = params[:partial] || "change_from_table" # Default partial
  end


  def link_data
    # Step 1: Fetch and build standard job order links
    grouped_jobs = CareerJob
      .joins(:career_compensations)
      .select(
        "career_jobs.id",
        "career_jobs.job_grouping",
        "career_jobs.job_order",
        "career_jobs.industry",
        "career_compensations.level AS level"
      )
      .where.not(job_grouping: nil, job_order: nil) # Ensure valid grouping and order
      .order(:job_grouping, :job_order)            # Sort by grouping and job order
  
    # Remove duplicate jobs within the same grouping
    unique_jobs = grouped_jobs.uniq { |job| [job.id, job.job_grouping, job.job_order] }
  
    # Debug grouped jobs
    Rails.logger.debug "Grouped Jobs: #{unique_jobs.map { |job| { id: job.id, industry: job.industry, level: job.level, order: job.job_order } }}"
  
    # Build job order links
    job_to_node_mapping = {}
    node_mapping.each do |node|
      node[:names].each do |name|
        job_to_node_mapping[[node[:industry].strip.downcase, name.strip.downcase]] = node
      end
    end
  
    # Debug job-to-node mapping keys
    Rails.logger.debug "Job to Node Mapping Keys: #{job_to_node_mapping.keys}"
  
    # Build standard links based on job order
    standard_links = unique_jobs.group_by(&:job_grouping).flat_map do |_grouping, jobs|
      jobs.each_cons(2).filter_map do |to_job, from_job| # Flip order for `to_job` -> `from_job`
        next if to_job.job_order >= from_job.job_order
  
        source_node = job_to_node_mapping[[from_job.industry.strip.downcase, from_job.level.strip.downcase]]
        target_node = job_to_node_mapping[[to_job.industry.strip.downcase, to_job.level.strip.downcase]]
  
        next unless source_node && target_node
  
        # Ensure no duplicate links and order nodes correctly
        {
          source: source_node[:id],
          target: target_node[:id],
          source_industry: source_node[:industry],
          source_level: source_node[:names].first,
          target_industry: target_node[:industry],
          target_level: target_node[:names].first,
          **calculate_link_data(to_job, from_job) # Add calculated link differences
        }
      end
    end
  
    # Step 2: Generate level change links
    level_change_links = generate_level_change_links
  
    # Combine all links
    combined_links = standard_links + level_change_links
  
    # Step 3: Aggregate links based on source and target node IDs
    aggregated_links = aggregate_links(combined_links, node_mapping)
  
    # Step 4: Return aggregated links as JSON
    render json: aggregated_links
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  # Helper method to calculate link-specific data
  def calculate_link_data(to_job, from_job)
    number_of_weeks_worked = 48

    # Fetch compensation data for source and target jobs
    career_compensations = CareerCompensation
      .where(career_job_id: [to_job.id, from_job.id])
      .group(:career_job_id)
      .select(
        :career_job_id,
        "AVG(salary) AS avg_salary",
        "AVG(bonus) AS avg_bonus",
        "AVG(hours_worked_per_week) AS avg_hours_worked_per_week"
      )

    # Extract data for the source and target jobs
    source_data = career_compensations.find { |c| c.career_job_id == from_job.id } || {}
    target_data = career_compensations.find { |c| c.career_job_id == to_job.id } || {}

    # Compute differences (target - source)
    salary_diff = target_data[:avg_salary].to_f - source_data[:avg_salary].to_f
    bonus_diff = target_data[:avg_bonus].to_f - source_data[:avg_bonus].to_f

    # Calculate compensation per hour based on hours worked and weeks worked
    source_hours = (source_data[:avg_hours_worked_per_week].to_f * number_of_weeks_worked).nonzero? || 1
    target_hours = (target_data[:avg_hours_worked_per_week].to_f * number_of_weeks_worked).nonzero? || 1

    source_comp_per_hour = (source_data[:avg_salary].to_f + source_data[:avg_bonus].to_f) / source_hours
    target_comp_per_hour = (target_data[:avg_salary].to_f + target_data[:avg_bonus].to_f) / target_hours

    comp_per_hour_diff = target_comp_per_hour - source_comp_per_hour

    # Calculate the difference in hours worked per week
    hours_worked_diff = target_data[:avg_hours_worked_per_week].to_f - source_data[:avg_hours_worked_per_week].to_f

    {
      salary_diff: salary_diff.round(2),
      bonus_diff: bonus_diff.round(2),
      total_comp_diff: (salary_diff + bonus_diff).round(2),
      comp_per_hour_diff: comp_per_hour_diff.round(2),
      hours_worked_diff: hours_worked_diff.round(2) # Add this to the output
    }
  end


  def aggregate_links(links, node_mapping)
    grouped_links = links.group_by { |link| [link[:source], link[:target]] }
  
    grouped_links.map do |(source, target), grouped|
      count = grouped.size
      {
        source: source,
        target: target,
        source_industry: grouped.first[:source_industry],
        source_level: grouped.first[:source_level],
        target_industry: grouped.first[:target_industry],
        target_level: grouped.first[:target_level],
        avg_salary_diff: (grouped.sum { |l| l[:salary_diff] } / count).round(2),
        avg_bonus_diff: (grouped.sum { |l| l[:bonus_diff] } / count).round(2),
        avg_total_comp_diff: (grouped.sum { |l| l[:total_comp_diff] } / count).round(2),
        avg_comp_per_hour_diff: (grouped.sum { |l| l[:comp_per_hour_diff] } / count).round(2),
        avg_hours_worked_diff: (grouped.sum { |l| l[:hours_worked_diff] } / count).round(2) # Include avg hours worked difference
      }
    end
  end

  def generate_level_change_links
    number_of_weeks_worked = 48
  
    # Step 1: Fetch career compensations grouped by career_job_id
    grouped_compensations = CareerCompensation
      .joins(:career_job) # Join to get the industry from career jobs
      .select(
        "career_compensations.career_job_id",
        "career_jobs.industry AS industry",
        "career_compensations.level",
        "AVG(career_compensations.salary) AS avg_salary",
        "AVG(career_compensations.bonus) AS avg_bonus",
        "AVG(career_compensations.hours_worked_per_week) AS avg_hours_worked_per_week"
      )
      .group("career_compensations.career_job_id", "career_jobs.industry", "career_compensations.level")
      .order("career_compensations.career_job_id", "career_compensations.level") # Ensure proper ordering by level
  
    # Step 2: Group compensations by career_job_id
    links = grouped_compensations.group_by(&:career_job_id).flat_map do |_job_id, records|
      # Generate links for consecutive levels
      records.each_cons(2).map do |from_record, to_record|
        # Map source and target nodes using their levels and industries
        source_node = node_mapping.find do |node|
          node[:industry].strip.downcase == from_record.industry.strip.downcase &&
            node[:names].include?(from_record.level.strip.downcase)
        end
  
        target_node = node_mapping.find do |node|
          node[:industry].strip.downcase == to_record.industry.strip.downcase &&
            node[:names].include?(to_record.level.strip.downcase)
        end
  
        next unless source_node && target_node # Skip if nodes can't be mapped
  
        # Ensure source node has a lower ID and target node has a higher ID
        if source_node[:id] > target_node[:id]
          source_node, target_node = target_node, source_node
        end
  
        # Calculate differences
        salary_diff = to_record.avg_salary.to_f - from_record.avg_salary.to_f
        bonus_diff = to_record.avg_bonus.to_f - from_record.avg_bonus.to_f
  
        # Calculate compensation per hour differences
        source_hours = (from_record.avg_hours_worked_per_week.to_f * number_of_weeks_worked).nonzero? || 1
        target_hours = (to_record.avg_hours_worked_per_week.to_f * number_of_weeks_worked).nonzero? || 1
  
        source_comp_per_hour = (from_record.avg_salary.to_f + from_record.avg_bonus.to_f) / source_hours
        target_comp_per_hour = (to_record.avg_salary.to_f + to_record.avg_bonus.to_f) / target_hours
  
        comp_per_hour_diff = target_comp_per_hour - source_comp_per_hour
        hours_worked_diff = to_record.avg_hours_worked_per_week.to_f - from_record.avg_hours_worked_per_week.to_f
  
        # Build link data
        {
          source: source_node[:id],
          source_industry: source_node[:industry],
          source_level: source_node[:names].first,
          target: target_node[:id],
          target_industry: target_node[:industry],
          target_level: target_node[:names].first,
          salary_diff: salary_diff.round(2),
          bonus_diff: bonus_diff.round(2),
          total_comp_diff: (salary_diff + bonus_diff).round(2),
          comp_per_hour_diff: comp_per_hour_diff.round(2),
          hours_worked_diff: hours_worked_diff.round(2)
        }
      end
    end.compact
  
    links
  end
  
  

  private

  def node_mapping
    [
      # Venture Capital
      { id: 1, names: ["Analyst"], level: 1, industry: "Venture Capital" },
      { id: 2, names: ["Pre-MBA associate"], level: 2, industry: "Venture Capital" },
      { id: 3, names: ["Senior associate"], level: 3, industry: "Venture Capital" },
      { id: 4, names: ["Principal"], level: 4, industry: "Venture Capital" },
      { id: 5, names: ["Partner"], level: 5, industry: "Venture Capital" },
  
      # Private Equity
      { id: 6, names: ["Analyst"], level: 1, industry: "Private Equity" },
      { id: 7, names: ["Associate"], level: 2, industry: "Private Equity" },
      { id: 8, names: ["Vice president"], level: 3, industry: "Private Equity" },
      { id: 9, names: ["Principal"], level: 4, industry: "Private Equity" },
      { id: 10, names: ["Partner"], level: 5, industry: "Private Equity" },
  
      # Hedge Fund
      { id: 11, names: ["Junior Analyst"], level: 1, industry: "Hedge Fund" },
      { id: 12, names: ["Research Associate"], level: 2, industry: "Hedge Fund" },
      { id: 13, names: ["Fund Analyst"], level: 3, industry: "Hedge Fund" },
      { id: 14, names: ["Sector Head"], level: 4, industry: "Hedge Fund" },
      { id: 15, names: ["Portfolio Manager"], level: 5, industry: "Hedge Fund" },
  
      # Investment Banking
      { id: 16, names: ["Analyst"], level: 1, industry: "Investment Banking" },
      { id: 17, names: ["Associate"], level: 2, industry: "Investment Banking" },
      { id: 18, names: ["Vice president"], level: 3, industry: "Investment Banking" },
      { id: 19, names: ["Senior vice president","Executive Director"], level: 4, industry: "Investment Banking" },
      { id: 20, names: ["Managing director"], level: 5, industry: "Investment Banking" },
  
      # Corporate Development
      { id: 21, names: ["Analyst"], level: 1, industry: "Corporate Development" },
      { id: 22, names: ["Associate"], level: 2, industry: "Corporate Development" },
      { id: 23, names: ["Manager"], level: 3, industry: "Corporate Development" },
      { id: 24, names: ["Director"], level: 4, industry: "Corporate Development" },
      { id: 25, names: ["Vice president"], level: 5, industry: "Corporate Development" },
  
      # Investment Management
      { id: 26, names: ["Analyst"], level: 1, industry: "Investment Management" },
      { id: 27, names: ["Associate"], level: 2, industry: "Investment Management" },
      { id: 28, names: ["Senior Associate"], level: 3, industry: "Investment Management" },
      { id: 29, names: ["Portfolio Manager"], level: 4, industry: "Investment Management" },
      { id: 30, names: ["Director"], level: 5, industry: "Investment Management" },
  
      # FP&A
      { id: 31, names: ["Analyst"], level: 1, industry: "FP&A" },
      { id: 32, names: ["Senior Analyst"], level: 2, industry: "FP&A" },
      { id: 33, names: ["Manager"], level: 3, industry: "FP&A" },
      { id: 34, names: ["Director"], level: 4, industry: "FP&A" },
      { id: 35, names: ["Vice president"], level: 5, industry: "FP&A" },
  
      # Other
      { id: 36, names: ["Entry Level"], level: 1, industry: "Other" },
      { id: 37, names: ["Mid Level"], level: 2, industry: "Other" },
      { id: 38, names: ["Senior Level"], level: 3, industry: "Other" },
      { id: 39, names: ["Lead"], level: 4, industry: "Other" },
      { id: 40, names: ["Executive"], level: 5, industry: "Other" },
    ]
  end
  
  
  

end
