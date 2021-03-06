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

ActiveRecord::Schema.define(:version => 20121004052542) do

  create_table "donations", :force => true do |t|
    t.string   "scheduled_dropoff"
    t.string   "dropped_off_date"
    t.string   "date_delivered"
    t.string   "family_code"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dropoff_site"
    t.integer  "approved_by"
    t.integer  "num_boxes"
  end

  create_table "email_templates", :force => true do |t|
    t.text     "template_body"
    t.string   "editor_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", :force => true do |t|
    t.boolean  "display"
    t.text     "profile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "family_code"
    t.integer  "locationID"
    t.integer  "approved_by"
  end

  create_table "family_members", :force => true do |t|
    t.string   "family_code"
    t.string   "firstname"
    t.integer  "age"
    t.string   "gender"
    t.text     "comment"
    t.string   "pant_size"
    t.string   "shirt_size"
    t.string   "dress_size"
    t.string   "shoe_size"
    t.text     "wishlist"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.integer  "identity"
    t.integer  "locationID"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "phone"
    t.string   "organization"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
  end

end
