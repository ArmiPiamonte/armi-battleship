class CreateCells < ActiveRecord::Migration[7.0]
  def change
    create_table :cells do |t|
      t.references :board, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
