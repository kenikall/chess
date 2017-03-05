require 'rails_helper'

describe Board do
  def expect_empty_spaces_for(a_board)
    (2..5).each do |row|
      8.times do |col|
        expect(a_board[row][col][:content]).to be_falsey
      end
    end
  end

  def expect_pawns_are_in_place_for(a_board)
    8.times do |col|
      expect(a_board[6][col][:content]).to eq('wPawn.png')
      expect(a_board[1][col][:content]).to eq('bPawn.png')
    end

  end

  let(:board) do
    Board.create.board
  end

  describe "Sets up board correctly" do
    context "Space names" do
      let(:cols) { %w(h g f e d c b a) }
      let(:ids) { [] }

      before do
        8.times do |i|
          row = []
          8.times{ |k| row << {name: (cols[k])+(i+1).to_s}}
          ids << row
        end
      end

      it "spaces are correctly named" do
        8.times do |row|
          8.times do |col|
              expect(board[row][col][:name]).to eq(ids[row][col][:name])
            end
          end
        end
      end

    context "Pieces start in the correct locations" do

      it "pawns are correctly placed" do
        expect_pawns_are_in_place_for(board)
      end

      it "black pieces are correctly placed" do
        expect(board[0][0][:content]).to eq('bRook.png')
        expect(board[0][1][:content]).to eq('bBishop.png')
        expect(board[0][2][:content]).to eq('bKnight.png')
        expect(board[0][3][:content]).to eq('bQueen.png')
        expect(board[0][4][:content]).to eq('bKing.png')
        expect(board[0][5][:content]).to eq('bBishop.png')
        expect(board[0][6][:content]).to eq('bKnight.png')
        expect(board[0][7][:content]).to eq('bRook.png')
      end

      it "white pieces are correctly placed" do
        expect(board[7][0][:content]).to eq('wRook.png')
        expect(board[7][1][:content]).to eq('wBishop.png')
        expect(board[7][2][:content]).to eq('wKnight.png')
        expect(board[7][3][:content]).to eq('wQueen.png')
        expect(board[7][4][:content]).to eq('wKing.png')
        expect(board[7][5][:content]).to eq('wBishop.png')
        expect(board[7][6][:content]).to eq('wKnight.png')
        expect(board[7][7][:content]).to eq('wRook.png')
      end

      it "all spaces without pieces are empty" do
        expect_empty_spaces_for(board)
      end
    end
  end

  describe ".build_empty_board" do
    context "when a game is started, it will require an empty board with all the"\
            " pieces in their starting positions" do
      it "generates an empty board data structure" do
        expect {
          a_board = described_class.create_empty_board
          a_board.save!
          a_board = Board.last
          expect(a_board.state[0][0][:content]).to eq('bRook.png')
          expect_empty_spaces_for(a_board.state)
          expect_pawns_are_in_place_for(a_board.state)
        }.to change { Board.count }.by(1)
      end
    end
  end
end
