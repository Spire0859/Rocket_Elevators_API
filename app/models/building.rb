class Building < ApplicationRecord
    belongs_to :customer
    has_one :address
    has_many :batteries
end