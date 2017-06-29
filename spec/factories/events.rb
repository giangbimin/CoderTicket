FactoryGirl.define do
  factory :event do
    name { Faker::Name.name }
    extended_html_description { Faker::Name.name }
    category
    venue
    starts_at { Time.current }
  end
end
