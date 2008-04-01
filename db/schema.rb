# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 6) do

  create_table "blog_images", :force => true do |t|
    t.binary  "data"
    t.integer "post_id"
  end

  create_table "comments", :force => true do |t|
    t.string   "email_address"
    t.text     "body"
    t.boolean  "active",        :default => true
    t.datetime "posted_on"
    t.integer  "post_id"
  end

  create_table "portfolio_images", :force => true do |t|
    t.binary  "data"
    t.string  "title"
    t.integer "position"
  end

  create_table "posts", :force => true do |t|
    t.string "title"
    t.text   "body"
    t.date   "posted_on"
    t.date   "updated_on"
  end

  create_table "posts_tags", :id => false, :force => true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.boolean "active", :default => true
  end

end
