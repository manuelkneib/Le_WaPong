class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :league, null: false, foreign_key: true
      t.references :player1, null: false, foreign_key: { to_table: :users }
      t.references :player2, null: false, foreign_key: { to_table: :users }
      t.references :winner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
