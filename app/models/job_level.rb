# == Schema Information
#
# Table name: job_levels
#
#  id                       :bigint           not null, primary key
#  is_global_default        :boolean          default(FALSE), not null
#  is_position_type_default :boolean          default(FALSE), not null
#  level_rank               :integer
#  name                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  company_id               :bigint           not null
#  position_type_id         :bigint
#
# Indexes
#
#  index_job_levels_on_company_id                 (company_id)
#  index_job_levels_on_name_and_company_and_type  (name,company_id,position_type_id) UNIQUE
#  index_job_levels_on_position_type_id           (position_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (position_type_id => position_types.id)
#
class JobLevel < ApplicationRecord
  belongs_to :company_type

  has_many :employees, dependent: :nullify

  validates :name, presence: true
end
