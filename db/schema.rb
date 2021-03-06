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

ActiveRecord::Schema.define(version: 2021_11_25_224151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.string "genres", null: false
    t.string "country", null: false
    t.date "active", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["name", "user_id"], name: "index_artists_on_name_and_user_id", unique: true
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "list_songs", force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "song_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playlist_id"], name: "index_list_songs_on_playlist_id"
    t.index ["song_id"], name: "index_list_songs_on_song_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name", null: false
    t.string "created_by", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["name", "created_by", "user_id"], name: "index_playlists_on_name_and_created_by_and_user_id", unique: true
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.string "name", null: false
    t.string "album", null: false
    t.decimal "duration", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["name", "artist_id"], name: "index_Songs_on_name_and_artist_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artists", "users"
  add_foreign_key "list_songs", "playlists"
  add_foreign_key "list_songs", "songs"
  add_foreign_key "playlists", "users"
  add_foreign_key "songs", "artists"
end
