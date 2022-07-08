class Batteries < ApplicationRecord
    belongs_to :buildings
    has_many :columns
end