class CreateCombinedJobsView < ActiveRecord::Migration[7.1]
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW combined_jobs AS
      SELECT 
          cj.id AS job_id,
          cj.industry,
          cj.company,
          cj.location,
          NULL AS job_title,
          NULL AS "group",
          cc.level,
          cc.sub_level,
          cc.salary AS average_salary,
          cc.bonus AS average_bonus,
          cc.hours_worked_per_week AS average_hours_worked_per_week,
          1 AS sample_size,
          cj.years_at_job AS year,
          cj.previous_undergrad,
          cj.previous_grad,
          cj.previous_mba,
          'regular' AS source_type
      FROM career_jobs cj
      LEFT JOIN career_compensations cc ON cj.id = cc.career_job_id

      UNION ALL

      SELECT 
          caj.id AS job_id,
          caj.industry,
          caj.company,
          caj.location,
          caj.job_title,
          caj."group",
          caj.level,
          caj.sub_level,
          caj.average_salary,
          caj.average_bonus,
          caj.average_hours_worked_per_week,
          caj.sample_size,
          caj.year,
          caj.previous_undergrad,
          caj.previous_grad,
          caj.previous_mba,
          'aggregate' AS source_type
      FROM career_aggregate_jobs caj;
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW IF EXISTS combined_jobs;
    SQL
  end
end
