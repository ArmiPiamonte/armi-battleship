class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
