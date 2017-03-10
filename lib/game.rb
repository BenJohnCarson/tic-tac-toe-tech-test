require_relative 'player'

class Game
  
  attr_reader :players
  
  def initialize(player_class = Player)
    create_players(player_class)
  end
  
  private
  
  def create_players(player_class)
    player_X = player_class.new(:X)
    player_O = player_class.new(:O)
    @players = [player_X, player_O]
  end
end