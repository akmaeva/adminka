class Country < ApplicationRecord
    has_many :regions
    has_many :towns
    has_many :hostels
    
    validates :name, presence: true
end
