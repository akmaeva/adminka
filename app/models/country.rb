class Country < ApplicationRecord
    has_many :regions, dependent: :destroy
    has_many :towns, dependent: :destroy
    has_many :turbasas, dependent: :destroy
    
    validates :name, presence: true, uniqueness: true
end
