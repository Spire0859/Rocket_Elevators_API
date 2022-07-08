class Addresses < ApplicationRecord
    has_one :buildings
    has_one :customers
end