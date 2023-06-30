require 'rails_helper'

RSpec.describe Turbasa, type: :model do
  let(:country) { Country.create(name: 'Россия') }
  let(:region) { Region.create(name: 'Волгоградская область', country: country) }
  let(:town) { Town.create(name: 'Волгоград', region: region, country: country) }

  describe 'validations' do
    it 'requires name presence' do
      turbasa = Turbasa.new(town: town, region: region, country: country, contact: 'test')
      expect(turbasa).to be_invalid
    end

    it 'requires town_id presence' do
      turbasa = Turbasa.new(name: 'Новая турбаза', region: region, country: country, contact: 'test')
      expect(turbasa).to be_invalid
    end

    it 'requires region_id presence' do
      turbasa = Turbasa.new(name: 'Новая турбаза', town: town, country: country, contact: 'test')
      expect(turbasa).to be_invalid
    end

    it 'requires country_id presence' do
      turbasa = Turbasa.new(name: 'Новая турбаза', town: town, region: region, contact: 'test')
      expect(turbasa).to be_invalid
    end

    it 'requires contact presence' do
      turbasa = Turbasa.new(name: 'Новая турбаза', town: town, region: region, country: country)
      expect(turbasa).to be_invalid
    end
  end
end
