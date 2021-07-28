FactoryBot.define do
  factory :user, class: User do
    name { 'factory_user1' }
    email { 'user1@test.com'}
    password { 'password' }
  end

  factory :user2, class: User do
    name { 'factory_user2' }
    email { 'user2@test.com'}
    password { 'password' }
  end
end
