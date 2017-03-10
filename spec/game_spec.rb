describe Game do
  subject(:game) { described_class.new(player_class) }
  
  let(:player)        { double :player }
  let(:player_class)  { double :player_class, new: player }
  
  it "starts with two players" do
    expect(game.players).to eq [player, player]
  end
end