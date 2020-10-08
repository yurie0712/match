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

ActiveRecord::Schema.define(version: 2020_10_07_062300) do

  create_table "bookmark_tags", force: :cascade do |t|
    t.string "tagname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagname"], name: "index_bookmark_tags_on_tagname", unique: true
  end

  create_table "bookmark_tags_bookmarks", force: :cascade do |t|
    t.integer "bookmark_id"
    t.integer "bookmark_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookmark_id"], name: "index_bookmark_tags_bookmarks_on_bookmark_id"
    t.index ["bookmark_tag_id"], name: "index_bookmark_tags_bookmarks_on_bookmark_tag_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "caption"
  end

  create_table "like_tags", force: :cascade do |t|
    t.string "tagname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagname"], name: "index_like_tags_on_tagname", unique: true
  end

  create_table "like_tags_likes", force: :cascade do |t|
    t.integer "like_id"
    t.integer "like_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["like_id"], name: "index_like_tags_likes_on_like_id"
    t.index ["like_tag_id"], name: "index_like_tags_likes_on_like_tag_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "caption"
  end

  create_table "post_tags", force: :cascade do |t|
    t.string "tagname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagname"], name: "index_post_tags_on_tagname", unique: true
  end

  create_table "post_tags_posts", force: :cascade do |t|
    t.integer "post_id"
    t.integer "post_tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_tags_posts_on_post_id"
    t.index ["post_tag_id"], name: "index_post_tags_posts_on_post_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "image_id"
    t.text "caption"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "following_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["following_id"], name: "index_relationships_on_following_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image_id"
    t.text "introduction"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
