class Board
  
  attr_reader :grid
  
  def initialize(grid = default_grid)
    @grid = grid
  end
  
  def get(x, y)
    grid[y][x]
  end
  
  def set(x, y, marker)
    check_value(get(x, y))
    grid[y][x] = marker
  end
    
  def game_over
    winner = check_winner
    if winner
      "Winner is #{winner}"
    else
      false
    end
  end
  
  private
  
  def default_grid
    Array.new(3) { Array.new(3) {""} }
  end
  
  def check_value(value)
    raise "Value already set" if value != ""
  end
  
  def check_winner
    [grid, grid.transpose, diagonals].each do |position|
      position.each do |row|
        return row[0] if row.all? { |value| value == row[0] && value != "" }
      end
    end
    false
  end
  
  def diagonals
    [[get(0, 0), get(1, 1), get(2, 2)], [get(0, 2), get(1, 1), get(2, 0)]]
  end
end