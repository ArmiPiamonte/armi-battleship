class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :progress
      t.boolean :user_won, default: false

      t.timestamps
    end
  end
end
