class Type < ApplicationRecord
    has_many :pokemons, class_name: "Pokemon", foreign_key: "type1"
    has_many :pokemons, class_name: "Pokemon", foreign_key: "type2"
end
