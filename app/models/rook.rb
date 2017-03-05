class Rook < Piece
  def potential_moves
    moves = []
    row, col = current_location[0], current_location[1]
    step = 0
    while row + step < 7 && col + step < 7 && row - step > 0 && col - step > 0
      moves << [row + step][col] if row + step <= 7
      moves << [row - step][col] if row - step >= 0
      moves << [row][col + step] if col + step <= 7
      moves << [row][col - step] if col - step >= 0
      step += 1
    end
  end
end
