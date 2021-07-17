require 'rails_helper'

RSpec.describe 'ハッシュタグモデル機能', type: :model do
  it "nameがないと無効になる" do
    hashtag = Hashtag.new(
      name: nil)
    expect(hashtag).not_to be_valid
  end
  it "nameが255文字以上だと無効になる" do
    hashtag = Hashtag.new(
      name: 'hashtag_name_too_long_hashtag_name_too_long_hashtag_name_too_long_hashtag_name_too_long_hashtag_name_too_long_hashtag_name_too_long_hashtag_name_too_long_hashtag_name_too_long_hashtag_name_too_long_hashtag_name_too_long_hashtag_name_too_long_hashtag_name_too_long_')
    expect(hashtag).not_to be_valid
  end
end
