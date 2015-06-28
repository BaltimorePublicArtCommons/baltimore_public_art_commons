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

ActiveRecord::Schema.define(version: 20150628190233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.integer  "birth_date"
    t.integer  "deceased_date"
    t.string   "title",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.string   "bio_source",    limit: 255
  end

  create_table "fabrications", force: :cascade do |t|
    t.integer  "date"
    t.string   "fabricator", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.string   "country",    limit: 255
  end

  create_table "image_versions", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.string   "version",    limit: 255
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.string   "file",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type", limit: 255
  end

  create_table "individual_donors", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_artists", force: :cascade do |t|
    t.integer "item_id"
    t.integer "artist_id"
  end

  create_table "item_individual_donors", force: :cascade do |t|
    t.integer "item_id"
    t.integer "individual_donor_id"
  end

  create_table "item_organizational_donors", force: :cascade do |t|
    t.integer "item_id"
    t.integer "organizational_donor_id"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.string   "material",                limit: 255
    t.string   "genre",                   limit: 255
    t.integer  "installation_start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "height"
    t.float    "width"
    t.float    "depth"
    t.integer  "installation_end_date"
    t.text     "context"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "neighborhood",   limit: 255
    t.string   "street_address", limit: 255
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
    t.boolean  "current"
  end

  create_table "organizational_donors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organization",    limit: 255
    t.integer  "role",                        default: 2
  end

end
