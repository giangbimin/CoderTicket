FactoryGirl.define do
  factory :venue do
    name { Faker::Name.name }
    region
  end
end
