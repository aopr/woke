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

ActiveRecord::Schema.define(version: 20160831012556) do

  create_table "saved_tweets", force: :cascade do |t|
    t.integer  "tweeters_id"
    t.text     "tweet_url"
    t.integer  "favorties"
    t.integer  "retweets_count"
    t.text     "content"
    t.string   "hashtags"
    t.string   "urls"
    t.boolean  "is_retweet"
    t.string   "story_type"
    t.integer  "topic_id"
    t.boolean  "home_side"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "twitter_id"
    t.integer  "facebook_id"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
