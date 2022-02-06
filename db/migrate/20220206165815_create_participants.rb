class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.decimal :score, precision: 5, scale: 2
      t.references :game, foreign_key: true
      t.references :player, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
