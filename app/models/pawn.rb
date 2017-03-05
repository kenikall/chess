class Pawn < Piece
  def first_move?
    first_move
  end

  def en_passant?
    en_passant
  end

  def enable_en_pasant location
    @en_passant = location
    en_passant = true
  end

  def disable_en_pasant
    en_passant = false
  end

  def promote
  end

  def potential_moves
    moves = []

    if team = 'black'
      moves << [row, col + 1]
      moves << [row, col + 2] if first_move?
    else
      moves << [row, col - 1]
      moves << [row, col - 2] if first_move?
    end

    moves << @en_passant if en_passant?

  end
end
