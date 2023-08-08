class MusicAlbum < Item
  attr_accessor :cover_state, :on_spotify

  def initialize(name, publish_date, cover_state, on_spotify, archived: false)
    super(name, publish_date, archived: archived)
    @cover_state = cover_state
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify == true
  end
end
