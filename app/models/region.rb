class Region < ApplicationRecord
  belongs_to :country
  has_many :towns, dependent: :destroy
  has_many :turbasas, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :country_id, presence: true
end
