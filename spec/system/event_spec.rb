require 'rails_helper'

RSpec.describe 'イベント投稿機能', type: :system do

  let(:category_1){ FactoryBot.create(:category1) }
  let(:category_2){ FactoryBot.create(:category2) }
  let!(:user_1){ FactoryBot.create(:user) }

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with:'user1@test.com'
    fill_in 'パスワード', with:'password'
    click_button 'ログイン'
  end

  describe 'イベント新規投稿機能' do
    before do
      FactoryBot.create(:category1)
      visit events_path
      page.first('#mapid').click
      click_link 'この場所にイベントを投稿'
      fill_in 'イベント名', with:'テストイベント'
      fill_in '開催地', with:'テスト市テスト町一丁目'
      fill_in 'イベント詳細', with:'テストイベントの詳細 #ハッシュタグテスト'
      find('label', text: 'category1', match: :first ).click
      click_on '投稿'
    end

    context '新規作成した場合' do
      it '地図上にイベントが表示される',js: true do
        expect(page).to have_selector '.leaflet-marker-icon'
      end
    end

    context 'ハッシュタグを表記した場合' do
      it 'ハッシュタグにリンクが表示される', js: true do
        find('.leaflet-marker-icon').click
        click_link 'テストイベント'
        expect(page).to have_link '#ハッシュタグテスト'
      end
    end

  end

  describe 'イベント検索機能' do
    let!(:event1){ FactoryBot.create(:event, categories:[category_1], user: user_1) }
    let!(:event2){ FactoryBot.create(:event2, categories:[category_2], user: user_1) }
    before do
      visit events_path
    end
    it 'デフォルト状態で現在開催中のイベントが表示される' do
      expect(all('.leaflet-marker-icon').size).to eq(1)
    end
    context 'カテゴリーで検索した場合' do
      it '一致したカテゴリーを含むイベントが表示される' do
        find('label', text: 'category1').click
        click_on '検索'
        find('.leaflet-marker-icon').click
        expect(page).to have_selector '.cat-in-popup',text:'category1'
      end
    end
    context '開催日で検索した場合' do
      it '開催期間内に開催日があるイベントが表示される' do
        fill_in '開催日から検索',with: Time.now.since(10.days).strftime('%Y-%m-%d')
        click_on '検索'
        find('.leaflet-marker-icon').click
        expect(page).to have_selector '.event-title',text:'factory_event2'
      end
    end
  end

end
