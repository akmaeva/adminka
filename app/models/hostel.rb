class Hostel < ApplicationRecord
    belongs_to :town
    belongs_to :region
    belongs_to :country
end
