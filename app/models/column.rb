class Column < ApplicationRecord
    belongs_to :batterie
    has_one :elevator
end