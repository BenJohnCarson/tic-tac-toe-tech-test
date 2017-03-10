describe Game do
  subject(:game) { described_class.new([player_X, player_O]) }
  
  let(:player_X) { double :player, marker: :X }
  let(:player_O) { double :player, marker: :O }       
  
  
  it "starts with two players" do
    expect(game.players).to eq [player_X, player_O]
  end
  
  it "starts with player_X's turn" do
    expect(game.current_player).to eq player_X
  end
  
  it "can switch turns" do
    game.switch
    expect(game.current_player).to eq player_O
  end
end