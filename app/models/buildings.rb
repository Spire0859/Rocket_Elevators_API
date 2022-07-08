class Buildings < ApplicationRecord
    belongs_to :customers
    has_one :addresses
    has_many :batteries
end