class Lead < ApplicationRecord
    has_one :user, optional: true
end
