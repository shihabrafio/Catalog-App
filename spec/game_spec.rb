require_relative '../Classes/game'
require_relative '../Classes/item'

describe Game do
  before :each do
    @game = Game.new(1)
    @game.add_game(true, '2020-03-18')
  end

  it 'check for Game instance' do
    expect(@game).to be_an_instance_of(Game)
  end

  it 'Checks if Game is multiplayer' do
    expect(@game.multiplayer).to eq(true)
  end

  it 'Checks if Game is not multiplayer' do
    @game.add_game(false, '2021-03-18')
    expect(@game.multiplayer).to eq(false)
  end

  it 'Checks if game can be archived(1)' do
    @item = Item.new('2009-03-18')
    res = @game.send(:can_be_archived?, @item)
    expect(res).to eql true
  end

  it 'Checks if game can be archived(2)' do
    @item = Item.new('2014-03-18')
    res = @game.send(:can_be_archived?, @item)
    expect(res).to eql false
  end
end
