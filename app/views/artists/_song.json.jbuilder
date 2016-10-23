json.extract! song, :id, :title, :duration, :genre, :created_at, :updated_at
json.url artists_song_url(song, format: :json)
