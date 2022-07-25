class Building < ApplicationRecord
    belongs_to :customer, optional: true
    has_one :intervention
    has_one :building_detail
    has_one :batterie
end