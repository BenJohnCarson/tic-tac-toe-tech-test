require_relative 'player'

class Game
  
  attr_reader :players, :current_player, :other_player
  
  def initialize(players)
    @players = players
    set_current_player
  end
  
  def switch
    @current_player, @other_player = @other_player, @current_player
  end
    
  
  private
  
  def set_current_player
    players.each do |player|
      @current_player = player if player.marker == :X
      @other_player = player if player.marker == :O
    end
  end
end