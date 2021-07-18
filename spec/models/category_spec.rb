require 'rails_helper'

RSpec.describe 'カテゴリーモデル機能', type: :model do
  it "nameがないと無効になる" do
    category = FactoryBot.build(:category, name: nil)
    expect(category).not_to be_valid
  end
end
