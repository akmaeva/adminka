class Region < ApplicationRecord
  belongs_to :country
  has_many :towns
  has_many :hostels

  validates :name, presence: true, uniqueness: true
  validates :country_id, presence: true
end
