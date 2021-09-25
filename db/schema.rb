# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_25_132846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "readme_tools", force: :cascade do |t|
    t.bigint "readme_id", null: false
    t.bigint "tool_id", null: false
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["readme_id"], name: "index_readme_tools_on_readme_id"
    t.index ["tool_id"], name: "index_readme_tools_on_tool_id"
  end

  create_table "readmes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "staging_url"
    t.string "production_url"
    t.string "repository_url"
    t.boolean "keys_required"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_readmes_on_user_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.string "version"
    t.text "instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "readme_tools", "readmes"
  add_foreign_key "readme_tools", "tools"
  add_foreign_key "readmes", "users"
end
