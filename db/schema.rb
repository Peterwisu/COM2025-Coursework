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

ActiveRecord::Schema.define(version: 2021_11_25_224151) do

  #create table artists with composite primary keys from name and user_id.
  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.string "genres", null: false
    t.string "country", null: false
    t.date "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["name", "user_id"], name: "index_artists_on_name_and_user_id", unique: true
    t.index ["user_id"], name: "index_artists_on_user_id"
  end
  #create table list_songs as a join table of playlists and songs table since they have many to many relationship.
  #This has playlist_id and song_id as foreign keys from both tables respectively and its has no primary key in this table because this is to allow user to add a same song to a same playlist more than once.
  create_table "list_songs", force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "song_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_list_songs_on_playlist_id"
    t.index ["song_id"], name: "index_list_songs_on_song_id"
  end
  #create table playlists with composite primary keys from name, created_by and user_id .
  create_table "playlists", force: :cascade do |t|
    t.string "name", null: false
    t.string "created_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["name", "created_by", "user_id"], name: "index_playlists_on_name_and_created_by_and_user_id", unique: true
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end
  #create table songs with composite primary keys from name and artists_id .
  #this table has mant to one relationship with artist s,So it has artists_id as a foreign keys.
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
  
  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
