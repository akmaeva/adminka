require 'rails_helper'

RSpec.describe Town, type: :model do
  let(:country) { Country.create(name: 1) }
  let(:region) { Region.create(name: 1, country: country) }
  
  describe 'validations' do
    it 'requires name presence' do
      town = Town.new(region: region, country: country)
      expect(town).to be_invalid
    end

    it 'requires country_id presence' do
      town = Town.new(name: 'Волгоград', region: region)
      expect(town).to be_invalid
    end

    it 'requires region_id presence' do
      town = Town.new(name: 'Волгоград', country: country)
      expect(town).to be_invalid
    end

    it 'requires name uniqueness' do
      Town.create(name: 'Волгоград', region: region, country: country)
      town = Town.new(name: 'Волгоград', region: region, country: country)
      expect(town).to be_invalid
    end

  end
end
