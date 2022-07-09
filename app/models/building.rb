class Building < ApplicationRecord
    belongs_to :customer, optional: true
    has_one :address
    has_one :building_detail
    has_many :batteries
end