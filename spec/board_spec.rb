describe Board do
  subject(:board) { described_class.new }
  
  let(:empty_grid)      { Array.new(3) { Array.new(3) { "" } } }
  
  it "starts with a default grid" do
    expect(board.grid).to eq empty_grid
  end
  
  it "populates the grid with empty strings" do
    board.grid.each do |row|
      expect(row.size).to eq 3
    end
  end
  
  it "can get a value from the grid" do
    grid = [["", "", ""],["",:X,""],["","",""]]
    board = Board.new(grid)
    expect(board.get(1, 1)).to eq :X
  end
  
  it "can set a value on the grid" do
    board.set(1, 2, :O)
    expect(board.get(1, 2)).to eq :O
  end
  
  it "can't overwrite a value already set" do
    board.set(1, 2, :O)
    expect{ board.set(1, 2, :X) }.to raise_error "Value already set"
  end
  
  describe "#game_over" do
    it "returns false when no winner and not a draw" do
      expect(board.game_over).to eq false
    end
  
    it "can check for a winning row" do
      grid = [["", "", ""],["","",""],[:X,:X,:X]]
      board = Board.new(grid)
      expect(board.game_over).to eq "Winner is X"
    end
    
    it "can check for a winning column" do
      grid = [["", :X, ""],["",:X,""],["",:X,""]]
      board = Board.new(grid)
      expect(board.game_over).to eq "Winner is X"
    end
    
    it "can check for a winning diagonal" do
      grid = [[:X, "", ""],["",:X,""],["","",:X]]
      board = Board.new(grid)
      expect(board.game_over).to eq "Winner is X"
    end
  end
end