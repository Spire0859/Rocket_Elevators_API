class Building < ApplicationRecord
    belongs_to :customer, optional: true
    belongs_to :addresse
    has_one :building_detail
    has_one :batterie
end