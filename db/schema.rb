# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_02_090842) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "question"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "answer"
    t.string "subject"
    t.integer "courses_id"
    t.index ["courses_id"], name: "index_articles_on_course_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.string "salt", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_authors_on_email", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "author_name"
    t.text "body"
    t.integer "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.string "semester"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "definitions", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_definitions_on_course_id"
  end

  create_table "enrolments", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_taggings_on_article_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "articles", "courses", column: "courses_id"
  add_foreign_key "comments", "articles"
  add_foreign_key "definitions", "courses"
  add_foreign_key "taggings", "articles"
  add_foreign_key "taggings", "tags"
end
