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

ActiveRecord::Schema.define(version: 20171124103725) do

  create_table "chapters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "title"
    t.string "ancestry"
    t.index ["ancestry"], name: "index_chapters_on_ancestry"
  end

  create_table "chapters_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "chapter_id"
    t.bigint "question_id"
    t.index ["chapter_id"], name: "index_chapters_questions_on_chapter_id"
    t.index ["question_id"], name: "index_chapters_questions_on_question_id"
  end

  create_table "options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "content"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "correct", default: false
    t.index ["deleted_at"], name: "index_options_on_deleted_at"
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "practice_questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "result_id"
    t.bigint "question_id"
    t.text "choices"
    t.boolean "correct", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_practice_questions_on_question_id"
    t.index ["result_id"], name: "index_practice_questions_on_result_id"
  end

  create_table "practice_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "user_id"
    t.bigint "workbook_id"
    t.bigint "lesson_id"
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_practice_results_on_lesson_id"
    t.index ["user_id"], name: "index_practice_results_on_user_id"
    t.index ["workbook_id"], name: "index_practice_results_on_workbook_id"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_questions_on_deleted_at"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "cell", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "name"
    t.boolean "super", default: false
    t.index ["cell"], name: "users_cell_password_index"
    t.index ["type"], name: "index_users_on_type"
  end

  create_table "workbooks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.bigint "user_id"
    t.bigint "textbook_id"
    t.boolean "hidden", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["textbook_id"], name: "index_workbooks_on_textbook_id"
    t.index ["user_id"], name: "index_workbooks_on_user_id"
  end

end
