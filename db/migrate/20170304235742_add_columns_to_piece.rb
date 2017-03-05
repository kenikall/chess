class AddColumnsToPiece < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :row, :integer
    add_column :pieces, :col, :integer
  end
end
