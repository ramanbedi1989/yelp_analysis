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

ActiveRecord::Schema.define(version: 20140206173339) do

  create_table "hadoop_statuses", force: true do |t|
    t.boolean  "started"
    t.boolean  "db_to_hdfs"
    t.boolean  "yelp_fetcher"
    t.boolean  "hdfs_to_db"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inputs", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "last_fetches", force: true do |t|
    t.datetime "last_fetched_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "outputs", force: true do |t|
    t.integer  "merchant_id"
    t.string   "contract_id"
    t.string   "merchant_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone_no"
    t.float    "funded_amount"
    t.integer  "fico"
    t.integer  "sc3score"
    t.boolean  "nopo_flag"
    t.float    "annual_sales"
    t.string   "sic_code"
    t.string   "restaurant_category"
    t.string   "website_address"
    t.string   "hours"
    t.string   "parking"
    t.integer  "review_count"
    t.float    "average_rating"
    t.string   "menu_price"
    t.boolean  "accept_credit_card"
    t.string   "dress_code"
    t.boolean  "reservation"
    t.boolean  "take_out"
    t.boolean  "delivery"
    t.boolean  "caters"
    t.boolean  "has_tv"
    t.string   "noise_level"
    t.string   "alcohol"
    t.boolean  "outdoor_sitting"
    t.boolean  "waiter_service"
    t.boolean  "good_for_groups"
    t.boolean  "good_for_kids"
    t.float    "rating_median"
    t.float    "rating_mean"
    t.integer  "days_since_last_review"
    t.float    "last3_over_mean"
    t.float    "median_review_frequency"
    t.integer  "range_review_dates"
    t.float    "rating_variance"
    t.integer  "rating_iqr"
    t.integer  "review_frequency_iqr"
    t.integer  "rating_mad"
    t.integer  "review_frequency_mad"
    t.float    "rating_mean_30"
    t.float    "rating_mean_60"
    t.float    "rating_mean_90"
    t.float    "rating_mean_120"
    t.float    "rating_mean_150"
    t.float    "rating_mean_180"
    t.float    "rating_mean_210"
    t.float    "rating_mean_210_plus"
    t.datetime "review_date"
    t.string   "review_user_name"
    t.string   "review_city"
    t.text     "review_description"
    t.float    "review_rating"
    t.integer  "input_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
