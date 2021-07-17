require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザ登録テスト' do
    it "名前とemailとパスワードがあればユーザを作成できる" do
      user = User.new(
        name:'test',
        email:'test@test.com',
        password: 'password'
      )
      expect(user).to be_valid
    end

    it "名前がなければ登録に失敗する" do
      user = User.new(
        email:'test@test',
        password:'password'
      )
      expect(user).not_to be_valid
    end
    it "emailがなければ登録に失敗する" do
      user = User.new(
        name:'test',
        password:'password'
      )
      expect(user).not_to be_valid
    end
    it "passwordがなければ登録が失敗する" do
      user = User.new(
        name:'test',
        email:'test@test.com'
      )
      expect(user).not_to be_valid
    end
    it "emailがフォーマットから外れた場合、登録が失敗する" do
      user = User.new(
        name:'test',
        email:'test.com',
        password:'password'
      )
      expect(user).not_to be_valid
    end
  end
end
