FactoryBot.define do
  factory :car do
    brand
    sequence(:name) { |i| "brand name #{i}" }
  end
end
