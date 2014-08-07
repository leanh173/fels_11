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

ActiveRecord::Schema.define(version: 20140806100318) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.string   "content"
    t.boolean  "right_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name_course"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name_course"], name: "index_categories_on_name_course", using: :btree

  create_table "learnings", force: true do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "learnings", ["lesson_id"], name: "index_learnings_on_lesson_id", using: :btree
  add_index "learnings", ["user_id"], name: "index_learnings_on_user_id", using: :btree

  create_table "lessons", force: true do |t|
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["category_id"], name: "index_lessons_on_category_id", using: :btree

  create_table "questions", force: true do |t|
    t.integer  "lesson_id"
    t.string   "content"
    t.string   "word"
    t.string   "sound"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["lesson_id"], name: "index_questions_on_lesson_id", using: :btree
  add_index "questions", ["word"], name: "index_questions_on_word", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "user_answers", force: true do |t|
    t.integer  "learning_id"
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_answers", ["user_id", "question_id", "created_at"], name: "index_user_answers_on_user_id_and_question_id_and_created_at", unique: true, using: :btree
  add_index "user_answers", ["user_id"], name: "index_user_answers_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.boolean  "teacher",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
