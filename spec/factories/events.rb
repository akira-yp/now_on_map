FactoryBot.define do
  factory :event,class: Event do
    title { 'factory_event1' }
    description { 'event_description1'}
    start_date { Time.now }
    end_date { Time.now.since(7.days) }
    location { '東京都千代田区1-1' }
    latitude { 35.683864 }
    longitude { 139.745807 }
    
  end


  factory :event2,class: Event do
    title { 'factory_event2' }
    description { 'event_description2'}
    start_date { Time.now.since(8.days) }
    end_date { Time.now.since(15.days) }
    location { '新国立競技場' }
    latitude { 35.678021 }
    longitude { 139.714769 }

    trait :with_category2 do
      after(:create) do |event|
        event.categories << build(:category2)
      end
    end
  end

  factory :event3,class: Event do
    title { 'factory_event3' }
    description { 'event_description3'}
    start_date { Time.now.since(8.days) }
    end_date { Time.now.since(15.days) }
    location { 'テスト' }
    latitude { 35.678030 }
    longitude { 139.714730 }
  end

end
