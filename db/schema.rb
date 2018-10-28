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

ActiveRecord::Schema.define(version: 20181028070045) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "user_favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "favorite_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["favorite_id"], name: "index_user_favorites_on_favorite_id", using: :btree
    t.index ["user_id", "favorite_id"], name: "index_user_favorites_on_user_id_and_favorite_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_favorites_on_user_id", using: :btree
  end

  create_table "user_follows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_user_follows_on_follow_id", using: :btree
    t.index ["user_id", "follow_id"], name: "index_user_follows_on_user_id_and_follow_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_user_follows_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "user_favorites", "users"
  add_foreign_key "user_favorites", "users", column: "favorite_id"
  add_foreign_key "user_follows", "users"
  add_foreign_key "user_follows", "users", column: "follow_id"
end
