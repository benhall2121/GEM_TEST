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

ActiveRecord::Schema.define(:version => 20120806210908) do

  create_table "assets", :force => true do |t|
    t.string   "idString"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chk_out_ins", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "asset_id"
    t.datetime "checkedOutTime"
    t.datetime "checkedInTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "idString"
    t.string   "name"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
