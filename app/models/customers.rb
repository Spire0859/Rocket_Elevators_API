class Customers < ApplicationRecord
    has_many :buildings
    has_one :addresses
    has_one :users
end