require 'rails_helper'

RSpec.describe 'イベントモデル機能', type: :model do
  it "titleがないと無効になる" do
    event = FactoryBot.build(:event, title: nil)
    expect(event).not_to be_valid
  end
  it "descriptionがないと無効になる" do
    event = FactoryBot.build(:event, description: nil)
    expect(event).not_to be_valid
  end
  it "start_dateがないと無効になる" do
    event = FactoryBot.build(:event, start_date: nil)
    expect(event).not_to be_valid
  end
  it "end_dateがないと無効になる" do
    event = FactoryBot.build(:event, end_date: nil)
    expect(event).not_to be_valid
  end
  it "start_dateがend_dateより後の日付だと無効になる" do
    event = FactoryBot.build(:event, end_date: Time.now.ago(7.days))
    expect(event).not_to be_valid
  end
  it "latitudeがないと無効になる" do
    event = FactoryBot.build(:event, latitude: nil)
    expect(event).not_to be_valid
  end
  it "longitudeがないと無効になる" do
    event = FactoryBot.build(:event, longitude: nil)
    expect(event).not_to be_valid
  end
  it "locationがないと無効になる" do
    event = FactoryBot.build(:event, location: nil)
    expect(event).not_to be_valid
  end
  it "カテゴリーが紐づけられていないと無効になる" do
    event3 = FactoryBot.build(:event3)
    expect(event3).not_to be_valid
  end
end
