# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200818105807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boost_vib_l_inds", force: :cascade do |t|
    t.float    "frequency_8"
    t.float    "frequency_16"
    t.float    "frequency_31"
    t.float    "frequency_63"
    t.float    "frequency_125"
    t.float    "frequency_250"
    t.float    "frequency_500"
    t.float    "frequency_1000"
    t.integer  "type_axis"
    t.integer  "local_vib_f_indicator_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "boost_vib_l_inds", ["local_vib_f_indicator_id"], name: "index_boost_vib_l_inds_on_local_vib_f_indicator_id", using: :btree

  create_table "boost_vib_ls_inds", force: :cascade do |t|
    t.float    "frequency_8"
    t.float    "frequency_16"
    t.float    "frequency_31"
    t.float    "frequency_63"
    t.float    "frequency_125"
    t.float    "frequency_250"
    t.float    "frequency_500"
    t.float    "frequency_1000"
    t.integer  "type_axis"
    t.integer  "local_vib_s_indicator_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "boost_vib_ls_inds", ["local_vib_s_indicator_id"], name: "index_boost_vib_ls_inds_on_local_vib_s_indicator_id", using: :btree

  create_table "boost_vibro_indicators", force: :cascade do |t|
    t.float    "frequency_1"
    t.float    "frequency_2"
    t.float    "frequency_4"
    t.float    "frequency_8"
    t.float    "frequency_16"
    t.float    "frequency_31"
    t.float    "frequency_63"
    t.integer  "type_axis"
    t.integer  "total_vibration_indicator_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "boost_vibro_indicators", ["total_vibration_indicator_id"], name: "index_boost_vibro_indicators_on_total_vibration_indicator_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "full_name"
    t.string   "inn"
    t.string   "orgn"
    t.string   "kind_of_action"
    t.text     "location"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "control_tools", force: :cascade do |t|
    t.integer  "workpoint_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "control_tools", ["workpoint_id"], name: "index_control_tools_on_workpoint_id", using: :btree

  create_table "local_vib_f_indicators", force: :cascade do |t|
    t.string   "terms"
    t.float    "boost_level_x"
    t.float    "boost_level_y"
    t.float    "boost_level_z"
    t.integer  "staff_worker_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "working_operation_id"
  end

  add_index "local_vib_f_indicators", ["staff_worker_id"], name: "index_local_vib_f_indicators_on_staff_worker_id", using: :btree
  add_index "local_vib_f_indicators", ["working_operation_id"], name: "index_local_vib_f_indicators_on_working_operation_id", using: :btree

  create_table "local_vib_s_indicators", force: :cascade do |t|
    t.string   "terms"
    t.float    "boost_level_x"
    t.float    "boost_level_y"
    t.float    "boost_level_z"
    t.integer  "staff_worker_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "working_operation_id"
  end

  add_index "local_vib_s_indicators", ["staff_worker_id"], name: "index_local_vib_s_indicators_on_staff_worker_id", using: :btree
  add_index "local_vib_s_indicators", ["working_operation_id"], name: "index_local_vib_s_indicators_on_working_operation_id", using: :btree

  create_table "measurement_gauges", force: :cascade do |t|
    t.integer  "number_guage"
    t.integer  "control_tool_id"
    t.string   "number_vibration_sensor"
    t.string   "number_local_vibration_sensor1"
    t.string   "number_local_vibration_sensor2"
    t.string   "number_noise_sensor"
    t.string   "number_infrasound_sensor"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "measurement_gauges", ["control_tool_id"], name: "index_measurement_gauges_on_control_tool_id", using: :btree

  create_table "noise_indicators", force: :cascade do |t|
    t.string   "terms"
    t.float    "frequency_31"
    t.float    "frequency_63"
    t.float    "frequency_125"
    t.float    "frequency_250"
    t.float    "frequency_500"
    t.float    "frequency_1000"
    t.float    "frequency_2000"
    t.float    "frequency_4000"
    t.float    "frequency_8000"
    t.integer  "staff_worker_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.float    "min_lvl"
    t.float    "max_lvl"
    t.float    "pulse_noise"
    t.float    "peak_lvl"
    t.float    "equivalent_lvl"
    t.string   "character_noise"
    t.integer  "working_operation_id"
  end

  add_index "noise_indicators", ["staff_worker_id"], name: "index_noise_indicators_on_staff_worker_id", using: :btree
  add_index "noise_indicators", ["working_operation_id"], name: "index_noise_indicators_on_working_operation_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "mark_car"
    t.string   "model_car"
    t.string   "number_car"
    t.date     "last_visit"
    t.string   "description"
    t.string   "patronymic"
    t.string   "sex"
    t.string   "contact_phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "register_signals", force: :cascade do |t|
    t.string   "number_register"
    t.integer  "control_tool_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "register_signals", ["control_tool_id"], name: "index_register_signals_on_control_tool_id", using: :btree

  create_table "sensors", force: :cascade do |t|
    t.integer  "control_tool_id"
    t.string   "sensor_presence"
    t.string   "sensor_lv1"
    t.string   "sensor_lv2"
    t.string   "sensor_tivl"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "sensors", ["control_tool_id"], name: "index_sensors_on_control_tool_id", using: :btree

  create_table "staff_workers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "patronymic"
    t.integer  "subdivision_id"
    t.date     "birthday"
    t.date     "duration_work"
    t.string   "labor_activity_type"
    t.string   "labor_activity_category"
    t.integer  "duration_one_shift"
    t.integer  "workplace_id"
    t.integer  "work_in_workplace"
    t.text     "description_operation"
    t.integer  "additional_workplace_id"
    t.integer  "additional_work_in_workplace"
    t.text     "additional_description_operation"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "position"
  end

  add_index "staff_workers", ["additional_workplace_id"], name: "index_staff_workers_on_additional_workplace_id", using: :btree
  add_index "staff_workers", ["subdivision_id"], name: "index_staff_workers_on_subdivision_id", using: :btree
  add_index "staff_workers", ["workplace_id"], name: "index_staff_workers_on_workplace_id", using: :btree

  create_table "subdivisions", force: :cascade do |t|
    t.string   "name"
    t.string   "full_name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subdivisions", ["company_id"], name: "index_subdivisions_on_company_id", using: :btree

  create_table "total_vibration_indicators", force: :cascade do |t|
    t.string   "terms"
    t.float    "boost_level_x"
    t.float    "boost_level_y"
    t.float    "boost_level_z"
    t.integer  "staff_worker_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "working_operation_id"
  end

  add_index "total_vibration_indicators", ["staff_worker_id"], name: "index_total_vibration_indicators_on_staff_worker_id", using: :btree
  add_index "total_vibration_indicators", ["working_operation_id"], name: "index_total_vibration_indicators_on_working_operation_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "working_operations", force: :cascade do |t|
    t.integer  "staff_worker_id"
    t.date     "date_of_operation"
    t.integer  "duration_shift"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "working_operations", ["staff_worker_id"], name: "index_working_operations_on_staff_worker_id", using: :btree

  create_table "workplaces", force: :cascade do |t|
    t.string   "type_vpf"
    t.integer  "shift_duration"
    t.integer  "number_of_shift"
    t.integer  "subdivision_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "workplaces", ["subdivision_id"], name: "index_workplaces_on_subdivision_id", using: :btree

  create_table "workpoints", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type_vpf"
    t.integer  "workplace_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "description_file"
  end

  add_index "workpoints", ["workplace_id"], name: "index_workpoints_on_workplace_id", using: :btree

  add_foreign_key "boost_vib_l_inds", "local_vib_f_indicators"
  add_foreign_key "boost_vib_ls_inds", "local_vib_s_indicators"
  add_foreign_key "boost_vibro_indicators", "total_vibration_indicators"
  add_foreign_key "control_tools", "workpoints"
  add_foreign_key "local_vib_f_indicators", "staff_workers"
  add_foreign_key "local_vib_f_indicators", "working_operations"
  add_foreign_key "local_vib_s_indicators", "staff_workers"
  add_foreign_key "local_vib_s_indicators", "working_operations"
  add_foreign_key "measurement_gauges", "control_tools"
  add_foreign_key "noise_indicators", "staff_workers"
  add_foreign_key "noise_indicators", "working_operations"
  add_foreign_key "register_signals", "control_tools"
  add_foreign_key "sensors", "control_tools"
  add_foreign_key "staff_workers", "subdivisions"
  add_foreign_key "staff_workers", "workplaces"
  add_foreign_key "subdivisions", "companies"
  add_foreign_key "total_vibration_indicators", "staff_workers"
  add_foreign_key "total_vibration_indicators", "working_operations"
  add_foreign_key "working_operations", "staff_workers"
  add_foreign_key "workplaces", "subdivisions"
  add_foreign_key "workpoints", "workplaces"
end
