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

ActiveRecord::Schema.define(version: 20160831004943) do

  create_table "saved_feedlies", force: :cascade do |t|
    t.string   "source"
    t.string   "headline"
    t.text     "url"
    t.datetime "pub_date"
    t.text     "pic"
    t.text     "keywords"
    t.text     "lead"
    t.integer  "topic_id"
    t.string   "story_type"
    t.boolean  "home_feature"
    t.boolean  "home_main"
    t.boolean  "home_main_pic"
    t.boolean  "home_right"
    t.boolean  "topic_feature"
    t.boolean  "topic_pic"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
