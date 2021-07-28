require 'rails_helper'

RSpec.describe 'ハッシュタグ機能', type: :system do
  before do
    FactoryBot.create(:category)
    @user = FactoryBot.create(:user)
    visit new_user_session_path
    fill_in 'メールアドレス', with:'user1@test.com'
    fill_in 'パスワード', with:'password'
    click_button 'ログイン'
  end
  describe 'イベント新規投稿機能' do
    context 'マップをクリックして新規作成した場合' do
      before do
        visit events_path
        page.first('#mapid').click
        click_link 'この場所にイベントを投稿'
        fill_in 'イベント名', with:'テストイベント'
        fill_in '開催地', with:'テスト市テスト町一丁目'
        fill_in 'イベント詳細', with:'テストイベントの詳細 #ハッシュタグテスト'
        find('label', text: 'category1', match: :first ).click
        click_on '投稿'
      end
      it '地図上にイベントが表示される',js: true do
        expect(page).to have_selector '.leaflet-marker-icon'
      end
    end

  end
  # describe 'イベント一覧機能' do
  #   before do
  #
  #   end
  #   it '地図上にイベントマーカーが表示される' do
  #   end
  # end
end
