names = ['Ho Chi Minh', 'Ha Noi', 'Binh Thuan', 'Da Nang', 'Lam Dong']
FactoryGirl.define do
  factory :region do
    name { names[Region.all.count] }
  end
end
