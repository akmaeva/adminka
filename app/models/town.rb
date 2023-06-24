class Town < ApplicationRecord
  belongs_to :region
  belongs_to :country
  has_many :hostels
end
