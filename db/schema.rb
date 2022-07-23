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

ActiveRecord::Schema[7.0].define(version: 2022_07_23_085323) do
  create_table "certifications", id: { type: :string, limit: 36 }, charset: "utf8mb4", force: :cascade do |t|
    t.string "email", limit: 100, null: false
    t.string "code", limit: 20, null: false
    t.integer "isSignup", limit: 1, null: false
    t.datetime "deleteTime", precision: nil, null: false
    t.index ["code"], name: "indexCertificationCode"
    t.index ["deleteTime"], name: "IDX_716aee59ee337fe7c3967a34e0"
    t.index ["email"], name: "indexCertificationEmail"
  end

  create_table "tokens", id: { type: :string, limit: 36 }, charset: "utf8mb4", force: :cascade do |t|
    t.string "accessToken", limit: 250, null: false
    t.string "refreshToken", limit: 350, null: false
    t.integer "userID"
    t.index ["userID"], name: "REL_b1c8805a09a8ee2f22e6879e58", unique: true
  end

  create_table "users", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.datetime "createdAt", default: -> { "current_timestamp(6)" }, null: false
    t.datetime "updatedAt", default: -> { "current_timestamp(6) ON UPDATE current_timestamp(6)" }, null: false
    t.string "email", limit: 100, null: false
    t.string "nickname", limit: 10, null: false
    t.string "profileImage", null: false
    t.index ["email"], name: "indexUserEmail"
    t.index ["nickname"], name: "indexUserNickname"
  end

  add_foreign_key "tokens", "users", column: "userID", name: "FK_b1c8805a09a8ee2f22e6879e589"
end
