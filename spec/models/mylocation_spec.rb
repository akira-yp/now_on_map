require 'rails_helper'

RSpec.describe 'マイロケーションモデル機能', type: :model do
  it "nameがないと無効になる" do
    mylocation = FactoryBot.build(:mylocation, name: nil)
    expect(mylocation).not_to be_valid
  end
  it "my_latitudeがないと無効になる" do
    mylocation = FactoryBot.build(:mylocation, my_latitude: nil)
    expect(mylocation).not_to be_valid
  end
  it "my_longitudeがないと無効になる" do
    mylocation = FactoryBot.build(:mylocation, my_longitude: nil)
    expect(mylocation).not_to be_valid
  end
end
