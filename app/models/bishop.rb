class Bishop < Piece
  def potential_moves
    moves = []
    current_location[0] = row
    current_location[1] = col
    step = 0
    while row + step <= 7 && col + step <= 7 && row - step >= 0 && col - step >= 0
      moves << [row + step][col + step] if row + step <= 7 && col + step <= 7
      moves << [row - step][col + step] if row - step >= 0 && col + step <= 7
      moves << [row + step][col - step] if row + step <= 7 && col - step >= 0
      moves << [row - step][col - step] if row - step >= 0 && col - step >= 0
      step += 1
    end
  end
end
