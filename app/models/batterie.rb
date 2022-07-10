class Batterie < ApplicationRecord
    belongs_to :building
    has_many :columns
end