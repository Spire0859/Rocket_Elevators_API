class Employee < ApplicationRecord
    belongs_to :user, optional: true
    has_many :buildings
end