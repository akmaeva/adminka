class Turbasa < ApplicationRecord
  belongs_to :country
  belongs_to :region
  belongs_to :town

  validates :name, presence: true
  validates :town_id, presence: true
  validates :region_id, presence: true
  validates :country_id, presence: true
end
