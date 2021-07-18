FactoryBot.define do
  factory :comment do
    content { 'Hello' }
    association :user
  end
end
