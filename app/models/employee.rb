# == Schema Information
#
# Table name: employees
#
#  id                      :bigint           not null, primary key
#  flag_comment            :text
#  flagged                 :integer          default(0), not null
#  linkedin_url            :string
#  name                    :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  company_id              :bigint
#  graduate_school_id      :bigint
#  group_id                :bigint
#  job_level_id            :bigint
#  location_id             :bigint
#  position_type_id        :bigint
#  previous_company_id     :bigint
#  undergraduate_school_id :bigint
#
# Indexes
#
#  index_employees_on_company_id               (company_id)
#  index_employees_on_flagged                  (flagged)
#  index_employees_on_graduate_school_id       (graduate_school_id)
#  index_employees_on_group_id                 (group_id)
#  index_employees_on_job_level_id             (job_level_id)
#  index_employees_on_linkedin_url             (linkedin_url)
#  index_employees_on_location_id              (location_id)
#  index_employees_on_name                     (name)
#  index_employees_on_previous_company_id      (previous_company_id)
#  index_employees_on_undergraduate_school_id  (undergraduate_school_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (graduate_school_id => schools.id)
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (job_level_id => job_levels.id)
#  fk_rails_...  (location_id => locations.id)
#  fk_rails_...  (previous_company_id => companies.id)
#  fk_rails_...  (undergraduate_school_id => schools.id)
#
class Employee < ApplicationRecord
  belongs_to :job_level, optional: true
  belongs_to :company, optional: true
  belongs_to :position_type, optional: true
  belongs_to :previous_company, class_name: 'Company', optional: true
  belongs_to :group, optional: true
  belongs_to :location, optional: true
  belongs_to :undergraduate_school, class_name: 'School', optional: true
  belongs_to :graduate_school, class_name: 'School', optional: true

  has_and_belongs_to_many :employee_views, join_table: 'employee_views_employees'

  has_many :flags, as: :flaggable, dependent: :destroy

  has_many :ratings, dependent: :destroy

  has_one_attached :picture

  validates :name, presence: true
  validates :linkedin_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true
  validates :flagged, numericality: { only_integer: true }, allow_nil: true

  # Virtual attribute for removing the picture
  attr_accessor :remove_picture

  before_save :purge_picture, if: -> { remove_picture == '1' }

  def investment_banker?
    position_type&.name == "Investment Banker"
  end

   # Ransack: Allowlisted searchable attributes
   def self.ransackable_attributes(auth_object = nil)
    [
      "company_id",
      "created_at",
      "flag_comment",
      "flagged",
      "graduate_school_id",
      "group_id",
      "id",
      "job_level_id",
      "linkedin_url",
      "location_id",
      "name",
      "position_type_id",
      "previous_company_id",
      "undergraduate_school_id",
      "updated_at"
    ]
  end

  # Ransack: Allowlisted searchable associations
  def self.ransackable_associations(auth_object = nil)
    [
      "job_level",
      "company",
      "group",
      "location",
      "previous_company",
      "undergraduate_school",
      "graduate_school"
    ]
  end

  private

  def purge_picture
    picture.purge
  end
end
