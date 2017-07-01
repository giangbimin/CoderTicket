FactoryGirl.define do
  factory :venue do
    name { "name#{Venue.all.count}" }
    region
  end
end
