require 'rails_helper'

RSpec.describe Country, type: :model do
  context 'when creating a country' do
    describe 'validations' do
      it 'requires name presence' do
        country = Country.new
        expect(country).to be_invalid
      end
  
      it 'requires name uniqueness' do
        Country.create(name: 'Россия')
        country = Country.new(name: 'Россия')
        expect(country).to be_invalid
      end
    end
  end

  context 'when deleting a country' do
    it 'deletes associated regions' do
      country = Country.create(name: 'Россия')
      region = Region.create(name: 'Волгоградская область', country: country)

      expect { country.destroy }.to change { Region.count }.by(-1)
    end

    it 'deletes associated towns' do
      country = Country.create(name: 'Россия')
      region = Region.create(name: 'Волгоградская область', country: country)
      town = Town.create(name: 'Волгоград', country: country, region: region)

      expect { country.destroy }.to change { Town.count }.by(-1)
    end

    it 'deletes associated turbasas' do
      country = Country.create(name: 'Россия')
      region = Region.create(name: 'Волгоградская область', country: country)
      town = Town.create(name: 'Волгоград', country: country, region: region)
      turbasa = Turbasa.create(name: 'Новая турбаза', country: country, region: region, town: town, contact: 'test')

      expect { country.destroy }.to change { Turbasa.count }.by(-1)
    end
  end
end
