json.extract! music, :id, :song, :album, :band, :genre, :release, :created_at, :updated_at
json.url music_url(music, format: :json)
