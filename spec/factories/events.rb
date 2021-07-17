FactoryBot.define do
  factory :event do
    title { 'factory_event1' }
    description { 'event_description1'}
    start_date { Time.now }
    end_date { Time.now.since(7.days) }
    location { '東京都千代田区1-1' }
    latitude { 40.259944 }
    longitude { 140.646157 }
    association :user
  end
end
