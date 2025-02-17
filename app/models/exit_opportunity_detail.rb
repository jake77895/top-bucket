# == Schema Information
#
# Table name: exit_opportunities_details
#
#  id                         :bigint           not null, primary key
#  exit_opportunity_mapping_id :bigint           not null
#  target_company_name        :string           not null
#  target_group              :string
#  source_company_name       :string           not null
#  source_group             :string
#  likelihood               :integer           not null, default: 1
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class ExitOpportunityDetail < ApplicationRecord
  self.table_name = 'exit_opportunities_details'
  
  belongs_to :exit_opportunity_mapping

  validates :target_company_name, presence: true
  validates :source_company_name, presence: true
  validates :likelihood, presence: true
end 
