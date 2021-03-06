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

ActiveRecord::Schema.define(version: 2020_07_23_215403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commentforumlikes", force: :cascade do |t|
    t.bigint "commentforum_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentforum_id"], name: "index_commentforumlikes_on_commentforum_id"
    t.index ["user_id"], name: "index_commentforumlikes_on_user_id"
  end

  create_table "commentforums", force: :cascade do |t|
    t.text "reply"
    t.bigint "forumpost_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted"
    t.integer "acceptedscore"
    t.index ["forumpost_id"], name: "index_commentforums_on_forumpost_id"
    t.index ["user_id"], name: "index_commentforums_on_user_id"
  end

  create_table "correctionlikes", force: :cascade do |t|
    t.bigint "correction_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correction_id"], name: "index_correctionlikes_on_correction_id"
    t.index ["user_id"], name: "index_correctionlikes_on_user_id"
  end

  create_table "corrections", force: :cascade do |t|
    t.text "content"
    t.text "comment"
    t.boolean "correct"
    t.bigint "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "accepted"
    t.index ["entry_id"], name: "index_corrections_on_entry_id"
    t.index ["user_id"], name: "index_corrections_on_user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "journal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "resolved"
    t.index ["journal_id", "created_at"], name: "index_entries_on_journal_id_and_created_at"
    t.index ["journal_id"], name: "index_entries_on_journal_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "entrylikes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_id"], name: "index_entrylikes_on_entry_id"
    t.index ["user_id"], name: "index_entrylikes_on_user_id"
  end

  create_table "fluencies", force: :cascade do |t|
    t.integer "level"
    t.bigint "user_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_fluencies_on_language_id"
    t.index ["user_id"], name: "index_fluencies_on_user_id"
  end

  create_table "forumpostlikes", force: :cascade do |t|
    t.bigint "forumpost_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forumpost_id"], name: "index_forumpostlikes_on_forumpost_id"
    t.index ["user_id"], name: "index_forumpostlikes_on_user_id"
  end

  create_table "forumposts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted"
    t.integer "forumpostlangid"
    t.index ["user_id", "created_at"], name: "index_forumposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_forumposts_on_user_id"
  end

  create_table "journals", force: :cascade do |t|
    t.string "title"
    t.boolean "private"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "lang"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
  end

  create_table "notifiers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "punches", id: :serial, force: :cascade do |t|
    t.integer "punchable_id", null: false
    t.string "punchable_type", limit: 20, null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.datetime "average_time", null: false
    t.integer "hits", default: 1, null: false
    t.index ["average_time"], name: "index_punches_on_average_time"
    t.index ["punchable_type", "punchable_id"], name: "punchable_index"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "firstname"
    t.string "lastname"
    t.integer "temp_id"
    t.integer "f_temp_id"
    t.integer "points"
    t.datetime "confirmed_at"
    t.boolean "email_confirmed"
    t.string "tagarray", default: [], array: true
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "commentforumlikes", "commentforums"
  add_foreign_key "commentforumlikes", "users"
  add_foreign_key "commentforums", "forumposts"
  add_foreign_key "commentforums", "users"
  add_foreign_key "correctionlikes", "corrections"
  add_foreign_key "correctionlikes", "users"
  add_foreign_key "corrections", "entries"
  add_foreign_key "corrections", "users"
  add_foreign_key "entries", "journals"
  add_foreign_key "entries", "users"
  add_foreign_key "entrylikes", "entries"
  add_foreign_key "entrylikes", "users"
  add_foreign_key "fluencies", "languages"
  add_foreign_key "fluencies", "users"
  add_foreign_key "forumpostlikes", "forumposts"
  add_foreign_key "forumpostlikes", "users"
  add_foreign_key "forumposts", "users"
  add_foreign_key "journals", "users"
  add_foreign_key "taggings", "tags"
end
