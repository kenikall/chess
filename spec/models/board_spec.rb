require 'rails_helper'

describe Board do

  let(:board) do
    Board.create.board
  end

  describe "Sets up board correctly" do
    context "Space names" do
      cols = %w(h g f e d c b a)
      ids = []
      8.times do |i|
        row = []
        8.times{ |k| row << {name: (cols[k])+(i+1).to_s}}
        ids << row
      end

      it "spaces are correctly named" do
        correct_name = true
        8.times do |row|
          8.times do |col|
            expected_name = ids[row][col][:name]
              correct_name = correct_name && board[row][col][:name] == ids[row][col][:name]
            end
          end
        expect(correct_name).to be_truthy
        end
      end

    context "Pieces start in the correct locations" do
      it "black pawns are correctly placed" do
        correct_placement = true
        8.times do |col|
          correct_placement = false if board[1][col][:content] != 'bPawn.png'
        end
        expect(correct_placement).to be_truthy
      end

      it "white pawns are correctly placed" do
        correct_placement = true
        8.times do |col|
          correct_placement = false if board[6][col][:content] != 'wPawn.png'
        end
        expect(correct_placement).to be_truthy
      end

      it "black pieces are correctly placed" do
        correct_placement = true

        correct_placement = correct_placement && board[0][0][:content] == 'bRook.png'
        correct_placement = correct_placement && board[0][1][:content] == 'bBishop.png'
        correct_placement = correct_placement && board[0][2][:content] == 'bKnight.png'
        correct_placement = correct_placement && board[0][3][:content] == 'bQueen.png'
        correct_placement = correct_placement && board[0][4][:content] == 'bKing.png'
        correct_placement = correct_placement && board[0][5][:content] == 'bBishop.png'
        correct_placement = correct_placement && board[0][6][:content] == 'bKnight.png'
        correct_placement = correct_placement && board[0][7][:content] == 'bRook.png'

        expect(correct_placement).to be_truthy
      end

      it "white pieces are correctly placed" do
        correct_placement = true
        correct_placement = correct_placement && board[7][0][:content] == 'wRook.png'
        correct_placement = correct_placement && board[7][1][:content] == 'wBishop.png'
        correct_placement = correct_placement && board[7][2][:content] == 'wKnight.png'
        correct_placement = correct_placement && board[7][3][:content] == 'wQueen.png'
        correct_placement = correct_placement && board[7][4][:content] == 'wKing.png'
        correct_placement = correct_placement && board[7][5][:content] == 'wBishop.png'
        correct_placement = correct_placement && board[7][6][:content] == 'wKnight.png'
        correct_placement = correct_placement && board[7][7][:content] == 'wRook.png'

        expect(correct_placement).to be_truthy
      end

      it "all spaces without pieces are empty" do
        empty_space = true
        (2..5).each do |row|
          8.times do |col|
            empty_space = empty_space && board[row][col][:content] == nil
          end
        end

        expect(empty_space).to be_truthy
      end
    end

  end

end
