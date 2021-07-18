FactoryBot.define do
  factory :user do
    name { 'factory_user1' }
    email { 'user1@test.com'}
    password { 'password' }
  end
end
