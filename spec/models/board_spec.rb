require 'rails_helper'

describe Board do

  let(:board) do
    Board.create.board
  end

  describe "Sets up board correctly" do
    context "Should name spaces correctly" do
      cols = %w(h g f e d c b a)
      ids = []
      8.times do |i|
        row = []
        8.times{ |k| row << {name: (cols[k])+(i+1).to_s}}
        ids << row
      end

      8.times do |row|
        8.times do |col|
          expected_name = ids[row][col][:name]
          it "[#{row}][#{col}] is named #{expected_name}" do
            expect(board[row][col][:name]).to eq(expected_name)
          end
        end
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
        correct_placement = correct_placement && board[0][5][:content] == 'bKnight.png'
        correct_placement = correct_placement && board[0][6][:content] == 'bBishop.png'
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
        correct_placement = correct_placement && board[7][5][:content] == 'wKnight.png'
        correct_placement = correct_placement && board[7][6][:content] == 'wBishop.png'
        correct_placement = correct_placement && board[7][7][:content] == 'wRook.png'

        expect(correct_placement).to be_truthy
      end
    end

  end

end
