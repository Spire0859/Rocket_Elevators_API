class Batteries < ApplicationRecord
    has_one :buildings
    has_many :columns
end