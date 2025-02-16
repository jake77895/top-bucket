# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_02_16_193541) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "career_aggregate_jobs", force: :cascade do |t|
    t.string "job_title"
    t.string "company"
    t.string "industry"
    t.string "group"
    t.decimal "average_salary", precision: 10, scale: 2
    t.decimal "average_bonus", precision: 10, scale: 2
    t.integer "average_hours_worked_per_week"
    t.integer "sample_size"
    t.integer "year"
    t.string "level"
    t.string "sub_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.string "previous_undergrad"
    t.string "previous_grad"
    t.string "previous_mba"
  end

  create_table "career_compensations", force: :cascade do |t|
    t.bigint "career_job_id", null: false
    t.integer "year"
    t.string "level"
    t.string "sub_level"
    t.decimal "salary", precision: 10, scale: 2
    t.decimal "bonus", precision: 10, scale: 2
    t.integer "hours_worked_per_week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
    t.index ["career_job_id"], name: "index_career_compensations_on_career_job_id"
  end

  create_table "career_jobs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "company"
    t.string "industry"
    t.integer "start_year"
    t.integer "years_at_job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.integer "job_grouping"
    t.integer "job_order"
    t.string "previous_undergrad"
    t.string "previous_grad"
    t.string "previous_mba"
    t.index ["user_id"], name: "index_career_jobs_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "tier_list_id", null: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "user_id"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["tier_list_id"], name: "index_comments_on_tier_list_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "position_type_id", null: false
    t.index ["position_type_id"], name: "index_companies_on_position_type_id"
  end

  create_table "employee_views", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
  end

  create_table "employee_views_employees", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "employee_view_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_views_employees_on_employee_id"
    t.index ["employee_view_id"], name: "index_employee_views_employees_on_employee_view_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "job_level_id"
    t.bigint "company_id"
    t.bigint "previous_company_id"
    t.string "linkedin_url"
    t.integer "flagged", default: 0, null: false
    t.text "flag_comment"
    t.bigint "group_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "position_type_id"
    t.bigint "undergraduate_school_id"
    t.bigint "graduate_school_id"
    t.index ["company_id"], name: "index_employees_on_company_id"
    t.index ["flagged"], name: "index_employees_on_flagged"
    t.index ["graduate_school_id"], name: "index_employees_on_graduate_school_id"
    t.index ["group_id"], name: "index_employees_on_group_id"
    t.index ["job_level_id"], name: "index_employees_on_job_level_id"
    t.index ["linkedin_url"], name: "index_employees_on_linkedin_url"
    t.index ["location_id"], name: "index_employees_on_location_id"
    t.index ["name"], name: "index_employees_on_name"
    t.index ["previous_company_id"], name: "index_employees_on_previous_company_id"
    t.index ["undergraduate_school_id"], name: "index_employees_on_undergraduate_school_id"
  end

  create_table "employment_report_details", force: :cascade do |t|
    t.bigint "employment_report_id", null: false
    t.string "metric"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employment_report_id"], name: "index_employment_report_details_on_employment_report_id"
  end

  create_table "employment_report_employers", force: :cascade do |t|
    t.bigint "employment_report_id", null: false
    t.boolean "bcg"
    t.boolean "mckinsey"
    t.boolean "bain"
    t.boolean "amazon"
    t.boolean "goldman_sachs"
    t.boolean "jpmorgan"
    t.boolean "bank_of_america"
    t.boolean "citigroup"
    t.boolean "deloitte"
    t.boolean "lek"
    t.boolean "capital_one"
    t.boolean "parthenon"
    t.boolean "tiktok"
    t.boolean "evercore"
    t.boolean "google"
    t.boolean "morgan_stanley"
    t.boolean "guggenheim"
    t.boolean "lazard"
    t.boolean "samsung"
    t.boolean "ubs"
    t.boolean "walmart"
    t.boolean "kearney"
    t.boolean "oliver_wyman"
    t.boolean "alixpartners"
    t.boolean "analysis_group"
    t.boolean "pwc"
    t.boolean "accenture"
    t.boolean "alvarez_marsal"
    t.boolean "wells_fargo"
    t.boolean "barclays"
    t.boolean "jefferies"
    t.boolean "visa"
    t.boolean "blackarch"
    t.boolean "vanguard"
    t.boolean "dell"
    t.boolean "adobe"
    t.boolean "microsoft"
    t.boolean "davita"
    t.boolean "unitedhealth"
    t.boolean "cigna"
    t.boolean "eli_lilly"
    t.boolean "pg"
    t.boolean "pepsico"
    t.boolean "conagra"
    t.boolean "hershey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "amgen", default: false
    t.boolean "apple", default: false
    t.boolean "johnson_and_johnson", default: false
    t.boolean "kimberly_clark", default: false
    t.boolean "kraft_heinz", default: false
    t.boolean "mcmaster_carr", default: false
    t.boolean "nike", default: false
    t.index ["employment_report_id"], name: "index_employment_report_employers_on_employment_report_id"
  end

  create_table "employment_report_industries", id: :bigint, default: -> { "nextval('employment_report_functions_id_seq'::regclass)" }, force: :cascade do |t|
    t.bigint "employment_report_id", null: false
    t.decimal "consulting"
    t.decimal "investment_banking"
    t.decimal "private_equity"
    t.decimal "venture_capital"
    t.decimal "marketing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "diversified_financial"
    t.decimal "investment_management"
    t.decimal "technology"
    t.index ["employment_report_id"], name: "index_employment_report_functions_on_employment_report_id"
  end

  create_table "employment_report_locations", force: :cascade do |t|
    t.bigint "employment_report_id", null: false
    t.decimal "united_states"
    t.decimal "northeast"
    t.decimal "midwest"
    t.decimal "west"
    t.decimal "southwest"
    t.decimal "south"
    t.decimal "mid_atlantic"
    t.decimal "international"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employment_report_id"], name: "index_employment_report_locations_on_employment_report_id"
  end

  create_table "employment_report_overviews", force: :cascade do |t|
    t.bigint "employment_report_id", null: false
    t.integer "class_size"
    t.decimal "seeking_employment"
    t.decimal "not_seeking_employment"
    t.decimal "sponsored"
    t.decimal "starting_own_business"
    t.decimal "continuing_education"
    t.decimal "postponing_job_search"
    t.decimal "not_seeking_other"
    t.decimal "job_offers_3_months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "average_salary"
    t.index ["employment_report_id"], name: "index_employment_report_overviews_on_employment_report_id"
  end

  create_table "employment_report_programs", force: :cascade do |t|
    t.string "name"
    t.string "program_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employment_reports", force: :cascade do |t|
    t.bigint "employment_report_program_id", null: false
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employment_report_program_id"], name: "index_employment_reports_on_employment_report_program_id"
  end

  create_table "exit_opportunity_mappings", force: :cascade do |t|
    t.string "source_category"
    t.string "target_node_name"
    t.integer "likelihood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "target_industry"
  end

  create_table "flags", force: :cascade do |t|
    t.string "flaggable_type", null: false
    t.bigint "flaggable_id", null: false
    t.bigint "user_id", null: false
    t.string "reason"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text"
    t.index ["flaggable_type", "flaggable_id"], name: "index_flags_on_flaggable"
    t.index ["user_id"], name: "index_flags_on_user_id"
  end

  create_table "form_templates", force: :cascade do |t|
    t.string "form_context", null: false
    t.string "question_text", null: false
    t.string "response_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "position_type_id", null: false
    t.integer "position"
    t.index ["position_type_id"], name: "index_form_templates_on_position_type_id"
  end

  create_table "forum_comments", force: :cascade do |t|
    t.text "body"
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_forum_comments_on_parent_id"
    t.index ["post_id"], name: "index_forum_comments_on_post_id"
    t.index ["user_id"], name: "index_forum_comments_on_user_id"
  end

  create_table "forum_rooms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "company_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "position_type_id"
    t.boolean "position_type_default", default: false
    t.index ["company_id"], name: "index_groups_on_company_id"
    t.index ["location_id"], name: "index_groups_on_location_id"
    t.index ["position_type_id"], name: "index_groups_on_position_type_id"
  end

  create_table "interview_coaches", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "linkedin_url"
    t.string "industry", null: false
    t.text "description"
    t.string "languages"
    t.string "other_industries"
    t.string "highlighted_job", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["user_id"], name: "index_interview_coaches_on_user_id"
  end

  create_table "item_ranks", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "tier_list_id", null: false
    t.json "custom_values"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["item_id", "tier_list_id", "user_id"], name: "unique_item_rank_per_user", unique: true
    t.index ["item_id"], name: "index_item_ranks_on_item_id"
    t.index ["tier_list_id"], name: "index_item_ranks_on_tier_list_id"
    t.index ["user_id"], name: "index_item_ranks_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
  end

  create_table "job_levels", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level_rank"
    t.boolean "is_global_default", default: false, null: false
    t.boolean "is_position_type_default", default: false, null: false
    t.bigint "position_type_id"
    t.index ["company_id"], name: "index_job_levels_on_company_id"
    t.index ["name", "company_id", "position_type_id"], name: "index_job_levels_on_name_and_company_and_type", unique: true
    t.index ["position_type_id"], name: "index_job_levels_on_position_type_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mock_interview_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "recruiting_for"
    t.string "technical_prep_level"
    t.string "organization"
    t.string "linkedin_url"
    t.string "preferred_language"
    t.integer "english_proficiency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reliability_metric", default: 50, null: false
    t.string "time_zone", default: "Eastern Time (US & Canada)"
    t.integer "no_show_count", default: 0, null: false
    t.integer "late_count", default: 0, null: false
    t.integer "total_completes", default: 0, null: false
    t.index ["user_id"], name: "index_mock_interview_profiles_on_user_id"
  end

  create_table "mock_interviews", force: :cascade do |t|
    t.date "start_date", null: false
    t.time "start_time", null: false
    t.string "status", default: "pending", null: false
    t.bigint "created_by_id", null: false
    t.bigint "accepted_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_zone"
    t.datetime "check_date_time"
    t.string "creator_reliability_flag"
    t.string "acceptor_reliability_flag"
    t.index ["accepted_by_id"], name: "index_mock_interviews_on_accepted_by_id"
    t.index ["created_by_id"], name: "index_mock_interviews_on_created_by_id"
  end

  create_table "page_associations", force: :cascade do |t|
    t.bigint "page_id", null: false
    t.bigint "tier_list_id"
    t.string "association_type"
    t.jsonb "metadata", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_view_id"
    t.index ["employee_view_id"], name: "index_page_associations_on_employee_view_id"
    t.index ["page_id", "employee_view_id"], name: "index_page_associations_on_page_id_and_employee_view_id", unique: true, where: "(employee_view_id IS NOT NULL)"
    t.index ["page_id", "tier_list_id"], name: "index_page_associations_on_page_id_and_tier_list_id", unique: true
    t.index ["page_id"], name: "index_page_associations_on_page_id"
    t.index ["page_id"], name: "unique_employee_view_per_page", unique: true, where: "(employee_view_id IS NOT NULL)"
    t.index ["tier_list_id"], name: "index_page_associations_on_tier_list_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.integer "parent_id"
    t.integer "created_by"
    t.string "category", default: "general", null: false
    t.text "short_description"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_image"
    t.string "profile_image"
    t.index ["created_by"], name: "index_pages_on_created_by"
    t.index ["parent_id"], name: "index_pages_on_parent_id"
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  create_table "position_types", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "forum_room_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_room_id"], name: "index_posts_on_forum_room_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "question_packet_memberships", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "question_packet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_packet_memberships_on_question_id"
    t.index ["question_packet_id"], name: "index_question_packet_memberships_on_question_packet_id"
  end

  create_table "question_packets", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_question_packets_on_name", unique: true
  end

  create_table "questions", force: :cascade do |t|
    t.string "question_text", null: false
    t.string "answer_choice_1", null: false
    t.string "answer_choice_2", null: false
    t.string "answer_choice_3", null: false
    t.string "answer_choice_4", null: false
    t.integer "correct_answer", null: false
    t.text "explanation_text", null: false
    t.boolean "technical", default: false, null: false
    t.boolean "behavior", default: false, null: false
    t.string "category", null: false
    t.bigint "position_type_id", null: false
    t.integer "difficulty_level"
    t.string "related_organization"
    t.string "question_link"
    t.integer "question_link_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "related_group"
    t.index ["position_type_id"], name: "index_questions_on_position_type_id"
  end

  create_table "questions_users", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "user_id", null: false
    t.boolean "starred", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id", "user_id"], name: "index_questions_users_on_question_id_and_user_id", unique: true
    t.index ["question_id"], name: "index_questions_users_on_question_id"
    t.index ["user_id"], name: "index_questions_users_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "user_id", null: false
    t.string "form_context", null: false
    t.jsonb "responses", default: {}
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_ratings_on_employee_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "undergraduate", default: false, null: false
    t.boolean "mba", default: false, null: false
    t.boolean "other_graduate", default: false, null: false
    t.boolean "other", default: false, null: false
  end

  create_table "tier_list_templates", force: :cascade do |t|
    t.string "name", null: false
    t.text "short_description"
    t.json "custom_fields", default: []
    t.integer "created_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag"
    t.index ["created_by_id"], name: "index_tier_list_templates_on_created_by_id"
  end

  create_table "tier_lists", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "published"
    t.json "custom_fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tier_list_template_id"
    t.string "category"
    t.string "picture"
    t.index ["tier_list_template_id"], name: "index_tier_lists_on_tier_list_template_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name", default: "", null: false
    t.boolean "admin", default: false
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_interview_coach", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "career_compensations", "career_jobs", on_delete: :cascade
  add_foreign_key "career_jobs", "users"
  add_foreign_key "comments", "tier_lists"
  add_foreign_key "comments", "users"
  add_foreign_key "companies", "position_types"
  add_foreign_key "employee_views_employees", "employee_views"
  add_foreign_key "employee_views_employees", "employees", on_delete: :cascade
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "companies", column: "previous_company_id"
  add_foreign_key "employees", "groups"
  add_foreign_key "employees", "job_levels"
  add_foreign_key "employees", "locations"
  add_foreign_key "employees", "schools", column: "graduate_school_id"
  add_foreign_key "employees", "schools", column: "undergraduate_school_id"
  add_foreign_key "employment_report_details", "employment_reports"
  add_foreign_key "employment_report_employers", "employment_reports"
  add_foreign_key "employment_report_industries", "employment_reports"
  add_foreign_key "employment_report_locations", "employment_reports"
  add_foreign_key "employment_report_overviews", "employment_reports"
  add_foreign_key "employment_reports", "employment_report_programs"
  add_foreign_key "flags", "users"
  add_foreign_key "form_templates", "position_types"
  add_foreign_key "forum_comments", "posts"
  add_foreign_key "forum_comments", "users"
  add_foreign_key "groups", "companies"
  add_foreign_key "groups", "locations"
  add_foreign_key "groups", "position_types"
  add_foreign_key "interview_coaches", "users"
  add_foreign_key "item_ranks", "items"
  add_foreign_key "item_ranks", "tier_lists"
  add_foreign_key "item_ranks", "users", on_delete: :cascade
  add_foreign_key "job_levels", "companies"
  add_foreign_key "job_levels", "position_types"
  add_foreign_key "mock_interview_profiles", "users"
  add_foreign_key "mock_interviews", "users", column: "accepted_by_id"
  add_foreign_key "mock_interviews", "users", column: "created_by_id"
  add_foreign_key "page_associations", "employee_views"
  add_foreign_key "page_associations", "pages"
  add_foreign_key "page_associations", "tier_lists"
  add_foreign_key "posts", "forum_rooms"
  add_foreign_key "posts", "users"
  add_foreign_key "question_packet_memberships", "question_packets", on_delete: :cascade
  add_foreign_key "question_packet_memberships", "questions", on_delete: :cascade
  add_foreign_key "questions", "position_types"
  add_foreign_key "questions_users", "questions", on_delete: :cascade
  add_foreign_key "questions_users", "users"
  add_foreign_key "ratings", "employees"
  add_foreign_key "ratings", "users"
  add_foreign_key "tier_lists", "tier_list_templates"
end
