describe Game do
  subject(:game)  { described_class.new([player_X, player_O], board) }
  
  let(:player_X)  { double :player, marker: :X }
  let(:player_O)  { double :player, marker: :O }
  
  let(:board)     { double :board }
  
  it "starts with two players" do
    expect(game.players).to eq [player_X, player_O]
  end
  
  it "starts with player_X's turn" do
    expect(game.current_player).to eq player_X
  end
  
  it "starts with a new board" do
    expect(game.board).to eq board
  end
  
  describe "#take_turn" do
    before do
      allow(board).to receive(:set)
      allow(board).to receive(:game_over)
      game.take_turn(1, 2)
    end
  
    it "player can take their turn" do
      expect(board).to have_received(:set).with(1, 2, :X)
    end
    
    it "switches current player after take_turn" do
      expect(game.current_player).to eq player_O
    end
    
    it "checks for a finished game" do
      expect(board).to have_received(:game_over)
    end
  end
end