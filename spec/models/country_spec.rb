require 'rails_helper'

RSpec.describe Country, type: :model do
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
