def load_albums_from_json
  if File.exist?('./json_files/albums.json')
    albums_data = JSON.parse(File.read('./json_files/albums.json'))
    albums_data.map do |data|
      MusicAlbum.new(data['name'], data['publish_date'], data['cover_state'], data['on_spotify'],
                     archived: data['archived'])
    end
  else
    []
  end
end
