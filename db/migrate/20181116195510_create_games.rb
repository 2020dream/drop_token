class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :columns
      t.integer :rows
      t.string :state
      t.string :winner

      t.timestamps
    end
  end
end
