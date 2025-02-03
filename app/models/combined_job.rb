class CombinedJob < ApplicationRecord
  self.table_name = 'combined_jobs'

  # Define searchable attributes for Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[
      job_id industry company location job_title group level sub_level 
      average_salary average_bonus average_hours_worked_per_week sample_size 
      year previous_undergrad previous_grad previous_mba source_type
    ]
  end

  # Define searchable associations for Ransack
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
