class CreateBoats < ActiveRecord::Migration[7.0]
  def change
    create_table :boats do |t|
      t.references :cell, null: false, foreign_key: true

      t.timestamps
    end
  end
end
