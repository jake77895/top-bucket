# == Schema Information
#
# Table name: career_jobs
#
#  id                 :bigint           not null, primary key
#  company            :string
#  industry           :string
#  job_grouping       :integer
#  job_order          :integer
#  location           :string
#  previous_grad      :string
#  previous_mba       :string
#  previous_undergrad :string
#  start_year         :integer
#  years_at_job       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_career_jobs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class CareerJob < ApplicationRecord
  has_many :career_compensations, dependent: :destroy

  # Add these virtual attributes
  attr_accessor :matching_groups, :matching_job_levels

  validates :user_id, :company, presence: true
  validates :company, presence: true
  validates :location, presence: true
  validates :industry, presence: true
  validates :years_at_job, presence: true, numericality: { greater_than: 0 }
  validates :start_year, presence: true

  validates_associated :career_compensations # Ensure associated compensations are valid

  belongs_to :user
  # belongs_to :previous_job
  # belongs_to :next_job

  
    # Define searchable attributes for Ransack
    def self.ransackable_attributes(auth_object = nil)
      [
        "id",
        "user_id",
        "company",
        "industry",
        "start_year",
        "years_at_job",
        "location",
        "job_grouping",
        "job_order",
        "created_at",
        "updated_at",
        "previous_undergrad",
        "previous_grad",
        "previous_mba"
      ]
    end
  
    # Define searchable associations for Ransack
    def self.ransackable_associations(auth_object = nil)
      ["career_compensations"]
    end
  end
  