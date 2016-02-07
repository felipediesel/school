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

ActiveRecord::Schema.define(version: 20160206172553) do

  create_table "classrooms", force: :cascade do |t|
    t.string   "name"
    t.integer  "modality_id"
    t.integer  "teacher_id"
    t.integer  "room_id"
    t.integer  "day_of_week", limit: 1
    t.decimal  "start_at",              default: 0.0
    t.integer  "duration",              default: 3600
    t.boolean  "personal"
    t.text     "comment"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "classrooms", ["modality_id"], name: "index_classrooms_on_modality_id"
  add_index "classrooms", ["room_id"], name: "index_classrooms_on_room_id"
  add_index "classrooms", ["teacher_id"], name: "index_classrooms_on_teacher_id"

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
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.text     "comment"
    t.integer  "position",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "classroom_id"
    t.text     "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "subscriptions", ["classroom_id"], name: "index_subscriptions_on_classroom_id"
  add_index "subscriptions", ["student_id"], name: "index_subscriptions_on_student_id"

end
