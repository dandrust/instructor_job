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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160902163106) do

  create_table "job_listings", :force => true do |t|
    t.string   "company_name"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "course"
    t.string   "location"
    t.date     "class_date"
    t.datetime "class_time"
    t.integer  "number_of_students"
    t.decimal  "rate",                   :precision => 10, :scale => 0
    t.text     "description"
    t.integer  "awarded_application_id"
    t.boolean  "needs_insurance"
    t.boolean  "needs_equipment"
    t.boolean  "approved"
  end

end
