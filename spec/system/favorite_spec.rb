require 'rails_helper'

RSpec.describe 'お気に入り機能', type: :system, js: true do
  let!(:user_1){ FactoryBot.create(:user) }
  let(:category_1){ FactoryBot.create(:category1) }
  let(:category_2){ FactoryBot.create(:category2) }

  let!(:event1){ FactoryBot.create(:event, :with_category1, user: user_1) }

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with:'user1@test.com'
    fill_in 'パスワード', with:'password'
    click_button 'ログイン'
    find('.leaflet-marker-icon').click
    click_link event1.title
  end

  context 'お気に入りした場合' do
    it 'マイページの「気になるイベント一覧」に表示される',js: true do
      find('.dislike').click
      visit posts_index_user_path(user_1.id)
      expect(page).to have_selector '.leaflet-marker-icon'
    end
  end
end
