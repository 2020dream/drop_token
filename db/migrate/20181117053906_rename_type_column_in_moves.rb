class RenameTypeColumnInMoves < ActiveRecord::Migration[5.2]
  def change
    rename_column :moves, :type, :category
  end
end
