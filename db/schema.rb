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

ActiveRecord::Schema.define(version: 20160328194741) do

  create_table "classroom_schedules", force: :cascade do |t|
    t.integer  "classroom_id"
    t.integer  "teacher_id"
    t.integer  "room_id"
    t.integer  "week_day",     default: 1
    t.decimal  "start_at",     default: "19.0"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "classroom_schedules", ["classroom_id"], name: "index_classroom_schedules_on_classroom_id"
  add_index "classroom_schedules", ["room_id"], name: "index_classroom_schedules_on_room_id"
  add_index "classroom_schedules", ["teacher_id"], name: "index_classroom_schedules_on_teacher_id"

  create_table "classrooms", force: :cascade do |t|
    t.string   "title"
    t.integer  "modality_id"
    t.boolean  "personal"
    t.integer  "duration",    default: 3600
    t.text     "comment"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "classrooms", ["modality_id"], name: "index_classrooms_on_modality_id"

  create_table "levels", force: :cascade do |t|
    t.integer  "modality_id"
    t.string   "name"
    t.string   "color",       default: "#FFFFFF"
    t.integer  "position",    default: 0,         null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "levels", ["modality_id"], name: "index_levels_on_modality_id"

  create_table "modalities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "code"
    t.boolean  "student",              default: false
    t.boolean  "teacher",              default: false
    t.string   "name"
    t.string   "document1"
    t.string   "document2"
    t.date     "birthday"
    t.string   "status",               default: "active"
    t.string   "responsible_name"
    t.string   "responsible_document"
    t.string   "street"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "email"
    t.string   "blood_type"
    t.string   "profession"
    t.text     "comment"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "people", ["status"], name: "index_people_on_status"

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.text     "comment"
    t.integer  "position",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_levels", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "modality_id"
    t.integer  "level_id"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "student_levels", ["level_id"], name: "index_student_levels_on_level_id"
  add_index "student_levels", ["modality_id"], name: "index_student_levels_on_modality_id"
  add_index "student_levels", ["student_id"], name: "index_student_levels_on_student_id"

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "classroom_id"
    t.integer  "schedule_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "subscriptions", ["schedule_id"], name: "index_subscriptions_on_schedule_id"
  add_index "subscriptions", ["student_id"], name: "index_subscriptions_on_student_id"

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
