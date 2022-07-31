class Building < ApplicationRecord
    has_many :batteries
    belongs_to :customer, optional: true
    has_many :intervention
    has_one :building_detail
    has_many :batteries
end