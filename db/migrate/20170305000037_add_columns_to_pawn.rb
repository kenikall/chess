class AddColumnsToPawn < ActiveRecord::Migration[5.0]
  def change
    add_column :pieces, :first_move, :boolean, default: true
    add_column :pieces, :en_passant, :boolean, default: false
  end
end
