class Knight < Piece
  def potential_moves
    moves = []
    current_location[0] = row
    current_location[1] = col
    moves << [row + 1][col + 2] if row + 1 <= 7 && col + 2 <= 7
    moves << [row + 1][col - 2] if row + 1 <= 7 && col - 2 >= 0
    moves << [row - 1][col + 2] if row - 1 >= 0 && col + 2 <= 7
    moves << [row - 1][col - 2] if row - 1 <= 0 && col - 2 >= 0
    moves << [row + 2][col + 1] if row + 2 <= 7 && col + 1 <= 7
    moves << [row + 2][col - 1] if row + 2 <= 7 && col - 1 >= 0
    moves << [row - 2][col + 1] if row - 2 >= 0 && col + 1 <= 7
    moves << [row - 2][col - 1] if row - 2 >= 0 && col - 1 >= 0
  end
end
