# == Schema Information
#
# Table name: exit_opportunity_mappings
#
#  id               :bigint           not null, primary key
#  likelihood       :integer
#  source_category  :string
#  target_industry  :string
#  target_node_name :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class ExitOpportunityMapping < ApplicationRecord
  has_many :exit_opportunity_details, dependent: :destroy
  
  validates :source_category, presence: true
  validates :target_node_name, presence: true
end 
