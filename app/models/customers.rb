class Customers < ApplicationRecord
    has_many :buildings
    has_one :addresses
    belongs_to :users
end