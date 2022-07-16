class Customer < ApplicationRecord
    has_many :buildings
    belongs_to :user, optional: true
    has_one :addresse
    has_one :lead
end