require 'rails_helper'

RSpec.describe Region, type: :model do
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
