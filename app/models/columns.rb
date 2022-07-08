class Columns < ApplicationRecord
    has_one :batteries
    has_many :elevators
end