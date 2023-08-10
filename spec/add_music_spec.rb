require_relative '../modules/add_music'

RSpec.describe 'add_music_album' do
  it 'creates a new music album and assigns it a genre' do
    allow_any_instance_of(Object).to receive(:gets).and_return(
      'Album Name', '2023-07-16', 'good', 'true', 'false', 'Genre Name'
    )

    albums = []
    genres = []

    app = Object.new
    app.instance_variable_set('@albums', albums)
    app.instance_variable_set('@genres', genres)

    app.send(:add_music_album)

    expect(albums.length).to eq(1)
    expect(genres.length).to eq(1)
    expect(albums[0].genre.name).to eq('Genre Name')
  end
end
