names = ['Entertainment', 'Learning', 'Everything Else']
FactoryGirl.define do
  factory :category do
    name { names[Category.all.count] }
  end
end
