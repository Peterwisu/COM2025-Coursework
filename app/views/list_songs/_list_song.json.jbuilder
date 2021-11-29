json.extract! list_song, :id, :playlist_id, :song_id, :created_at, :updated_at
json.url list_song_url(list_song, format: :json)
