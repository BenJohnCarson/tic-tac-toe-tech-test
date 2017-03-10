require_relative 'player'
require_relative 'board'

class Game
  
  attr_reader :players, :current_player, :other_player, :board
  
  def initialize(players, board = Board.new)
    @players = players
    @board = board
    set_current_player
  end
  
  def take_turn(x, y)
    board.set(x, y, current_player.marker)
    switch
  end
  
  private
  
  def switch
    @current_player, @other_player = @other_player, @current_player
  end
  
  def set_current_player
    # TODO remove this hard coding- turn it into a random selection
    players.each do |player|
      @current_player = player if player.marker == :X
      @other_player = player if player.marker == :O
    end
  end
end