json.extract! song, :id, :name, :artist, :album, :duration, :created_at, :updated_at
json.url song_url(song, format: :json)
