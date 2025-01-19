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

ActiveRecord::Schema[7.1].define(version: 2025_01_19_230953) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
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

  create_table "item_ranks", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "tier_list_id", null: false
    t.json "custom_values"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["item_id"], name: "index_item_ranks_on_item_id"
    t.index ["tier_list_id"], name: "index_item_ranks_on_tier_list_id"
    t.index ["user_id"], name: "index_item_ranks_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "name"
    t.text "description"
    t.boolean "published"
    t.json "custom_fields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tier_list_template_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "tier_lists"
  add_foreign_key "comments", "users"
  add_foreign_key "companies", "position_types"
  add_foreign_key "employee_views_employees", "employee_views"
  add_foreign_key "employee_views_employees", "employees"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "companies", column: "previous_company_id"
  add_foreign_key "employees", "groups"
  add_foreign_key "employees", "job_levels"
  add_foreign_key "employees", "locations"
  add_foreign_key "employees", "schools", column: "graduate_school_id"
  add_foreign_key "employees", "schools", column: "undergraduate_school_id"
  add_foreign_key "flags", "users"
  add_foreign_key "form_templates", "position_types"
  add_foreign_key "forum_comments", "posts"
  add_foreign_key "forum_comments", "users"
  add_foreign_key "groups", "companies"
  add_foreign_key "groups", "locations"
  add_foreign_key "groups", "position_types"
  add_foreign_key "item_ranks", "items"
  add_foreign_key "item_ranks", "tier_lists"
  add_foreign_key "item_ranks", "users"
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
