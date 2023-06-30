class Town < ApplicationRecord
  belongs_to :region
  belongs_to :country
  has_many :turbasas

  validates :name, presence: true, uniqueness: true
  validates :country_id, presence: true
  validates :region_id, presence: true
end
