class Piece < ApplicationRecord
  def current_location
    [row, col]
  end
end
