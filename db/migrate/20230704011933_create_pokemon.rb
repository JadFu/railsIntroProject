class CreatePokemon < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons, id: false do |t|
      t.primary_key :id
      t.string :name
      t.integer :type1
      t.integer :type2
      t.integer :HP
      t.integer :ATK
      t.integer :DEF
      t.integer :SA
      t.integer :SD
      t.integer :SP
      t.string :image

      t.timestamps
    end
  end
end

