class Battery < ApplicationRecord
    belongs_to :buildings
    has_many :columns
end