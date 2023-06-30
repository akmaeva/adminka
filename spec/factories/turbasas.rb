FactoryBot.define do
  factory :turbasa do
    name { 'Новая турбаза' }
    association :country
    association :region
    association :town
    contact { 'test' }
  end
end
