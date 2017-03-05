class King < Piece
    def potential_moves
    moves = []
    current_location[0] = row
    current_location[1] = col

    moves << [row + 1][col + 1] if row + 1 < 7 && col + 1 < 7
    moves << [row - 1][col + 1] if row - 1 > 0 && col + 1 < 7
    moves << [row + 1][col - 1] if row + 1 < 7 && col - 1 > 0
    moves << [row - 1][col - 1] if row - 1 > 0 && col - 1 > 0
    moves << [row + 1][col] if row + 1 <= 7
    moves << [row - 1][col] if row - 1 >= 0
    moves << [row][col + 1] if col + 1 <= 7
    moves << [row][col - 1] if col - 1 >= 0

  end
end
