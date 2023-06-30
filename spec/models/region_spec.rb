require 'rails_helper'

RSpec.describe Region, type: :model do
  context 'when creating a region' do
    let(:country) { Country.create(name: 'Россия') }

    describe 'validations' do
      it 'requires name presence' do
        region = Region.new(country: country)
        expect(region).to be_invalid
      end

      it 'requires country_id presence' do
        region = Region.new(name: 'Волгоградская область')
        expect(region).to be_invalid
      end

      it 'requires name uniqueness' do
        Region.create(name: 'Волгоградская область', country: country)
        region = Region.new(name: 'Волгоградская область', country: country)
        expect(region).to be_invalid
      end
    end
  end

  context 'when deleting a region' do
    it 'deletes associated towns' do
      country = Country.create(name: 'Россия')
      region = Region.create(name: 'Волгоградская область', country: country)
      town = Town.create(name: 'Волгоград', country: country, region: region)

      expect { region.destroy }.to change { Town.count }.by(-1)
    end

    it 'deletes associated turbasas' do
      country = Country.create(name: 'Россия')
      region = Region.create(name: 'Волгоградская область', country: country)
      town = Town.create(name: 'Волгоград', country: country, region: region)
      turbasa = Turbasa.create(name: 'Новая турбаза', country: country, region: region, town: town, contact: 'test')

      expect { region.destroy }.to change { Turbasa.count }.by(-1)
    end
  end
end
