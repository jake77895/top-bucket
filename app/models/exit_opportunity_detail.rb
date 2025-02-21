# == Schema Information
#
# Table name: exit_opportunities_details
#
#  id                          :bigint           not null, primary key
#  description                 :text
#  likelihood                  :integer
#  source_company_name         :string           not null
#  source_group                :string
#  target_company_name         :string           not null
#  target_group                :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  exit_opportunity_mapping_id :bigint           not null
#
# Indexes
#
#  idx_on_exit_opportunity_mapping_id_b961f93084            (exit_opportunity_mapping_id)
#  index_exit_opportunities_details_on_source_company_name  (source_company_name)
#  index_exit_opportunities_details_on_target_company_name  (target_company_name)
#
# Foreign Keys
#
#  fk_rails_...  (exit_opportunity_mapping_id => exit_opportunity_mappings.id)
#
class ExitOpportunityDetail < ApplicationRecord
  self.table_name = 'exit_opportunities_details'
  
  belongs_to :exit_opportunity_mapping

  validates :target_company_name, presence: true
  validates :source_company_name, presence: true
  validates :likelihood, presence: true
end 
