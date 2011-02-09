# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110206173312) do

  create_table "account_admins", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "account_id"
  end

  create_table "accounts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "account_type"
  end

  create_table "departments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "hospital_id"
    t.string   "description"
  end

  add_index "departments", ["hospital_id"], :name => "index_departments_on_hospital_id"
  add_index "departments", ["name"], :name => "index_departments_on_name"

  create_table "departments_doctors", :force => true do |t|
    t.integer "department_id"
    t.integer "doctor_id"
  end

  add_index "departments_doctors", ["department_id"], :name => "index_departments_doctors_on_department_id"
  add_index "departments_doctors", ["doctor_id"], :name => "index_departments_doctors_on_doctor_id"

  create_table "departments_medical_procedures", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.integer  "medical_procedure_id"
    t.float    "cost"
  end

  add_index "departments_medical_procedures", ["department_id"], :name => "index_departments_medical_procedures_on_department_id"
  add_index "departments_medical_procedures", ["medical_procedure_id"], :name => "index_departments_medical_procedures_on_medical_procedure_id"

  create_table "doctors", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.string   "url"
    t.integer  "user_id"
  end

  add_index "doctors", ["city"], :name => "index_doctors_on_city"
  add_index "doctors", ["country"], :name => "index_doctors_on_country"
  add_index "doctors", ["state"], :name => "index_doctors_on_state"
  add_index "doctors", ["user_id"], :name => "index_doctors_on_user_id"
  add_index "doctors", ["zipcode"], :name => "index_doctors_on_zipcode"

  create_table "doctors_medical_procedures", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doctor_id"
    t.integer  "medical_procedure_id"
    t.float    "cost"
  end

  add_index "doctors_medical_procedures", ["doctor_id"], :name => "index_doctors_medical_procedures_on_doctor_id"
  add_index "doctors_medical_procedures", ["medical_procedure_id"], :name => "index_doctors_medical_procedures_on_medical_procedure_id"

  create_table "hospitals", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zipcode"
    t.integer  "user_id"
    t.string   "description", :limit => 1024
  end

  add_index "hospitals", ["city"], :name => "index_hospitals_on_city"
  add_index "hospitals", ["country"], :name => "index_hospitals_on_country"
  add_index "hospitals", ["state"], :name => "index_hospitals_on_state"
  add_index "hospitals", ["user_id"], :name => "index_hospitals_on_user_id"
  add_index "hospitals", ["zipcode"], :name => "index_hospitals_on_zipcode"

  create_table "med_post_categories", :force => true do |t|
    t.string   "title"
    t.integer  "plus_ratings"
    t.integer  "total_ratings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "med_posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.integer  "med_post_category_id"
    t.integer  "plus_ratings"
    t.integer  "total_ratings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "med_replies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "med_post_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_procedures", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "description", :limit => 1024
  end

  create_table "reviews", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",          :limit => 1024
    t.string   "author"
    t.integer  "stars_rating"
    t.integer  "department_id"
    t.integer  "medical_procedure_id"
  end

  add_index "reviews", ["department_id"], :name => "index_reviews_on_department_id"
  add_index "reviews", ["medical_procedure_id"], :name => "index_reviews_on_medical_procedure_id"
  add_index "reviews", ["stars_rating"], :name => "index_reviews_on_stars_rating"

  create_table "users", :force => true do |t|
    t.string   "user_name",                 :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "phone",                     :limit => 13
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.integer  "admin"
    t.integer  "account_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["user_name"], :name => "index_users_on_user_name", :unique => true

end
