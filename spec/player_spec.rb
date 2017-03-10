describe Player do
  subject(:player_X) { described_class.new(:X) }
  subject(:player_O) { described_class.new(:O) }
  
  it "has a marker" do
    expect(player_X.marker).to eq :X
  end
  
end