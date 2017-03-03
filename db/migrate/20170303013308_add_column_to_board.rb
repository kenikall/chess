class AddColumnToBoard < ActiveRecord::Migration[5.0]
  def change
    add_column :boards, :layout, :json, default: "{}"
  end
end
