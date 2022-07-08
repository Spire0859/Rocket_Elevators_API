class Columns < ApplicationRecord
    belongs_to :batteries
    has_many :elevators
end