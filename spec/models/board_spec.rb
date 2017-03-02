require 'rails_helper'

describe Board do
  let(:board) do
    Board.build_board
  end

  describe "build_board" do
    context "Should name spaces correctly" do

      cols = %w(h g f e d c b a)
      ids = []
      8.times do |i|
        row = []
        8.times{ |k| row << {name: (cols[k])+(i+1).to_s}}
        ids << row
      end

      it "[0][0] is named 'h1'" do
        p board[0][0]
        expect(board[0][0][:name]).to eq('h1')
      end
      # 8.times do |row|
      #   8.times do |col|
      #     expected_name = ids[row][col][:name]
      #     it "[#{row}][#{col}] is named #{expected_name}" do
      #       expect(board[row][col][:name]).to eq(expected_name)
      #     end
      #   end
      # end
    end
  end
  # it "Should initiate board with pieces in correct locations" do

  # end
end
