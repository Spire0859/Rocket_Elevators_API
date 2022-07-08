class Buildings < ApplicationRecord
    has_one :customers
    has_one :addresses
    has_many :batteries
end