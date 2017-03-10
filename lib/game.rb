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
    if board.game_over
      board.game_over
    else
      switch
    end
    board.grid
  end
  
  private
  
  def switch
    @current_player, @other_player = @other_player, @current_player
  end
  
  def set_current_player
    @current_player, @other_player = players.shuffle
  end
end