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

ActiveRecord::Schema.define(version: 20141028235909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "birth_date"
    t.integer  "deceased_date"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fabrications", force: true do |t|
    t.integer  "date"
    t.string   "fabricator"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
    t.string   "city"
    t.string   "state"
    t.string   "country"
  end

  create_table "image_versions", force: true do |t|
    t.string   "file"
    t.string   "version"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
  end

  create_table "individual_donors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_artists", force: true do |t|
    t.integer "item_id"
    t.integer "artist_id"
  end

  create_table "item_individual_donors", force: true do |t|
    t.integer "item_id"
    t.integer "individual_donor_id"
  end

  create_table "item_organizational_donors", force: true do |t|
    t.integer "item_id"
    t.integer "organizational_donor_id"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "material"
    t.string   "genre"
    t.integer  "installation_start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "height"
    t.float    "width"
    t.float    "depth"
    t.integer  "installation_end_date"
    t.text     "context"
  end

  create_table "locations", force: true do |t|
    t.string   "neighborhood"
    t.string   "street_address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
    t.boolean  "current"
  end

  create_table "organizational_donors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
