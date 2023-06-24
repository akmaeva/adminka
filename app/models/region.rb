class Region < ApplicationRecord
  belongs_to :country
  has_many :towns
  has_many :hostels
end
