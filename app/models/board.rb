# Game
# has_many users
# has_many boards

# Game.move(piece: Rook, to: "A5")
#    -> generates a new board

# game.boards.last

# Rook = Struct.new(:current_position) do
#   def possible_possitions_for(board: )
#     # array math

#     # array of output positions
#   end
# end

# class Game < ApplicationRecord
#   def start_new_game
#     # Board.create_empty_board_for(self)
#   end

#   def for_board
#     # board.move(...,..)
#     # board.save
#   end
# end

class Board < ApplicationRecord
  # belongs_to :game

  def self.create_empty_board
    board = Board.new
    board.layout = board.build_empty_board.to_json
    board
  end


  def state
    JSON.parse(layout, symbolize_names: true)
  end
  # def build

  def move(old_position, new_position)
    # outputs new board
    # self.layout = ...
  end

  def board
    build_empty_board
  end

  def build_empty_board
    add_chess_pieces_to(prepared_empty_board)
  end

  private

  def prepared_empty_board
    cols = %w(h g f e d c b a)
    empty_board = []
    8.times do |i|
      row = []
      8.times { |k| row << { name: (cols[k])+(i+1).to_s, content: nil } }
      empty_board << row
    end
    empty_board
  end

  def add_chess_pieces_to(board)
    board[1].each do |space|
      space[:content] = 'bPawn.png'
    end

    board[6].each do |space|
      space[:content] = 'wPawn.png'
    end

    board[0][0][:content], board[0][7][:content] = 'bRook.png', 'bRook.png'
    board[0][1][:content], board[0][5][:content] = 'bBishop.png', 'bBishop.png'
    board[0][2][:content], board[0][6][:content] = 'bKnight.png', 'bKnight.png'
    board[0][3][:content] = 'bQueen.png'
    board[0][4][:content] = 'bKing.png'

    board[7][0][:content], board[7][7][:content] = 'wRook.png', 'wRook.png'
    board[7][1][:content], board[7][5][:content] = 'wBishop.png', 'wBishop.png'
    board[7][2][:content], board[7][6][:content] = 'wKnight.png', 'wKnight.png'
    board[7][3][:content] = 'wQueen.png'
    board[7][4][:content] = 'wKing.png'
    board
  end
end
