json.extract! song, :id, :artist_id, :name, :album, :duration, :created_at, :updated_at
json.url song_url(song, format: :json)
