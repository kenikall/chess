class Board < ApplicationRecord

  def board
    build_board if !@board
    return @board
  end

  private

  def build_board
    name_spaces
    set_pieces
  end

  def name_spaces
    cols = %w(h g f e d c b a)
    @board = []
    8.times do |i|
      row = []
      8.times{ |k| row << {name: (cols[k])+(i+1).to_s, content: nil}}
      @board << row
    end
    @board
  end

  def set_pieces
    @board[1].each do |space|
      space[:content] = 'bPawn.png'
    end

    @board[6].each do |space|
      space[:content] = 'wPawn.png'
    end

    @board[0][0][:content], @board[0][7][:content] = 'bRook.png', 'bRook.png'
    @board[0][1][:content], @board[0][5][:content] = 'bBishop.png', 'bBishop.png'
    @board[0][2][:content], @board[0][6][:content] = 'bKnight.png', 'bKnight.png'
    @board[0][3][:content] = 'bQueen.png'
    @board[0][4][:content] = 'bKing.png'

    @board[7][0][:content], @board[7][7][:content] = 'wRook.png', 'wRook.png'
    @board[7][1][:content], @board[7][5][:content] = 'wBishop.png', 'wBishop.png'
    @board[7][2][:content], @board[7][6][:content] = 'wKnight.png', 'wKnight.png'
    @board[7][3][:content] = 'wQueen.png'
    @board[7][4][:content] = 'wKing.png'
  end
end
