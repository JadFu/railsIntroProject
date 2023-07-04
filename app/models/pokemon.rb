class Pokemon < ApplicationRecord
    belongs_to :type1, class_name: "Type"
    belongs_to :type2, class_name: "Type", optional: true
end