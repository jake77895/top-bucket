# == Schema Information
#
# Table name: job_levels
#
#  id           :bigint           not null, primary key
#  company_type :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint           not null
#
# Indexes
#
#  index_job_levels_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class JobLevel < ApplicationRecord
  belongs_to :company_type

  has_many :employees, dependent: :nullify

  validates :name, presence: true
end
