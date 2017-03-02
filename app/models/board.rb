class Board < ApplicationRecord
  def build_board
    cols = %w(h g f e d c b a)
    @board = []
    8.times do |i|
      row = []
      8.times{ |k| row << {name: (cols[k])+(i+1).to_s, content: nil}}
      @board << row
    end
    set_peices
  end

  def set_pieces
    @board[1].each do |space|
    end
  end
end
