class Lead < ApplicationRecord
    has_one :user, foreign_key: true
    belongs_to :customer, optional: true
    has_one_attached :file
end
