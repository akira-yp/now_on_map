FactoryBot.define do
  factory :mylocation do
    name { 'mylocation1' }
    my_latitude { 40.259944 }
    my_longitude { 140.646157 }
    association :user, factory: :user
  end
end
