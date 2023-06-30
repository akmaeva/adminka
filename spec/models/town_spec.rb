require 'rails_helper'

RSpec.describe Town, type: :model do
  context 'when creating a town' do
    let(:country) { Country.create(name: "Россия") }
    let(:region) { Region.create(name: "Волгоградская область", country: country) }
  
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

  context 'when deleting a town' do
    it 'deletes associated turbasas' do
      country = Country.create(name: 'Россия')
      region = Region.create(name: 'Волгоградская область', country: country)
      town = Town.create(name: 'Волгоград', country: country, region: region)
      turbasa = Turbasa.create(name: 'Новая турбаза', country: country, region: region, town: town, contact: 'test')

      expect { town.destroy }.to change { Turbasa.count }.by(-1)
    end
  end
end
