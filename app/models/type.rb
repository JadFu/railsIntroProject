class Type < ApplicationRecord
    has_many :pokemon, foreign_key: "type1_id"
    has_many :pokemon, foreign_key: "type2_id"
end