class Pokemon < ApplicationRecord
    belongs_to :type_id, class_name: 'Type', foreign_key: "type1"
    belongs_to :type_id, class_name: 'Type', foreign_key: "type2", optional: true
end