describe Game do
  subject(:game)  { described_class.new([player_X, player_O], board) }
  
  let(:player_X)  { double :player, marker: :X }
  let(:player_O)  { double :player, marker: :O }
  
  let(:board)     { double :board }
  
  before do
    allow(board).to receive(:set)
  end
  
  it "starts with two players" do
    expect(game.players).to eq [player_X, player_O]
  end
  
  it "starts with player_X's turn" do
    expect(game.current_player).to eq player_X
  end
  
  it "starts with a new board" do
    expect(game.board).to eq board
  end
  
  it "player can take their turn" do
    game.take_turn(1, 2)
    expect(board).to have_received(:set).with(1, 2, :X)
  end
  
  it "switches current player after take_turn" do
    game.take_turn(1, 2)
    expect(game.current_player).to eq player_O
  end
end