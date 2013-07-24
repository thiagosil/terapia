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

ActiveRecord::Schema.define(:version => 20130724133640) do

  create_table "children", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "family_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "families", :force => true do |t|
    t.string   "mother"
    t.string   "father"
    t.integer  "number_of_children"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "telephone"
    t.string   "address"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "religion"
    t.string   "literacy"
    t.string   "email"
    t.string   "cellphone"
    t.string   "company"
    t.string   "position"
    t.string   "marital_status"
    t.string   "drugs"
    t.string   "allergies"
    t.string   "postal_code"
    t.string   "identity"
    t.string   "identity_issuer"
    t.date     "identity_expedition_date"
    t.string   "type"
    t.date     "beginning_date"
    t.date     "end_date"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "gender"
    t.boolean  "active"
    t.string   "cpf"
    t.string   "blood_type"
    t.string   "first_role"
    t.string   "second_role"
    t.integer  "children"
    t.string   "parish"
    t.string   "community"
    t.string   "pastoral"
    t.integer  "family_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "role"
  end

end
