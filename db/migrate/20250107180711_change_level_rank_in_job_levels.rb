class ChangeLevelRankInJobLevels < ActiveRecord::Migration[7.1]
  def change
    change_column :job_levels, :level_rank, :integer, null: true, default: nil
  end
end
