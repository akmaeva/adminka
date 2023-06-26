class Turbasa < ApplicationRecord
  belongs_to :country
  belongs_to :region
  belongs_to :town

  validates :name, presence: true
  validates :town, presence: true
  validates :region, presence: true
  validates :country, presence: true
end
