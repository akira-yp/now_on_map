require 'rails_helper'

RSpec.describe 'マイロケーション機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with:'user1@test.com'
    fill_in 'パスワード', with:'password'
    click_button 'ログイン'
    visit mypage_user_path(@user.id)
  end

  context 'マイロケーションを登録した場合', js:true do
    before do
      page.first('#mapid').click
      click_link 'この場所にマイロケーションを作成'
      within '#new_mylocation_modal' do
        fill_in 'マイロケーション名', with: 'マイロケテスト'
        fill_in '住所', with: '東京都テスト区テスト町'
        click_on '登録'
      end
    end

    it 'マイロケーションボタンが表示される', js: true do
      expect(page).to have_content 'マイロケテスト'
    end

    it 'イベント投稿ポップが出現する', js: true do
      find('.gotoMyloc').click
      expect(page).to have_link 'この場所にイベントを投稿'
    end

  end
end
