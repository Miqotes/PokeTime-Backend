class CreatePokemonteams < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemonteams do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
