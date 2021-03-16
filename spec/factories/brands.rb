FactoryBot.define do
  factory :brand do
    sequence(:name) { |i| "brand name #{i}" }
  end
end
