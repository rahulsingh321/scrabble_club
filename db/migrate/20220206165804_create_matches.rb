class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.string     :name
      t.references :game, foreign_key: true
      t.integer    :winner_player_id

      t.timestamps
    end
  end
end
