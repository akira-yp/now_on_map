require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザ登録テスト' do
    it "名前とemailとパスワードがあればユーザを作成できる" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "名前がなければ登録に失敗する" do
      user = FactoryBot.build(:user, name:nil)
      expect(user).not_to be_valid
    end
    it "emailがなければ登録に失敗する" do
      user = FactoryBot.build(:user, email:nil)
      expect(user).not_to be_valid
    end
    it "passwordがなければ登録が失敗する" do
      user = FactoryBot.build(:user, password:nil)
      expect(user).not_to be_valid
    end
    it "emailがフォーマットから外れた場合、登録が失敗する" do
      user = FactoryBot.build(:user, email:"test.com")
      expect(user).not_to be_valid
    end
  end
end
