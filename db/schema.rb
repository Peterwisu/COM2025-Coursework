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

ActiveRecord::Schema.define(version: 2021_11_24_045509) do

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.string "genres", null: false
    t.string "country", null: false
    t.date "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artists_on_name", unique: true
  end

  create_table "list_songs", force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "song_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_list_songs_on_playlist_id"
    t.index ["song_id"], name: "index_list_songs_on_song_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name", null: false
    t.string "created_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "created_by"], name: "index_playlists_on_name_and_created_by", unique: true
  end

  create_table "songs", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.string "name", null: false
    t.string "album", null: false
    t.decimal "duration", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_songs_on_artist_id"
    t.index ["name", "artist_id"], name: "index_Songs_on_name_and_artist_id", unique: true
  end

end
