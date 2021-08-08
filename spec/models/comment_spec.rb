require 'rails_helper'

RSpec.describe 'コメントモデル機能', type: :model do
  it "contentがないと無効になる" do
    comment = FactoryBot.build(:comment, content: nil)
    expect(comment).not_to be_valid
  end
  it "contentが255文字以上だと無効になる" do
    comment = FactoryBot.build(:comment, content: 'content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_content_too_long_')
    expect(comment).not_to be_valid
  end
end
