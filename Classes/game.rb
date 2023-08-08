require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def add_game(multi, last_played)
    @multiplayer = multi
    @last_played_at = last_played
  end

  private

  def can_be_archived?(item)
    return true if super(item) && ((Date.today - Date.parse(@last_played_at)).to_i / 365 >= 2)

    false
  end
end
