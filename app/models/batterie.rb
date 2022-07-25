class Batterie < ApplicationRecord
    belongs_to :building
    has_one :intervention
    has_many :columns
end