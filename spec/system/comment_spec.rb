require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do
  let!(:user_1){ FactoryBot.create(:user) }
  let(:category_1){ FactoryBot.create(:category1) }
  let(:category_2){ FactoryBot.create(:category2) }

  let!(:event1){ FactoryBot.create(:event, :with_category1, user: user_1) }

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with:'user1@test.com'
    fill_in 'パスワード', with:'password'
    click_button 'ログイン'
    visit events_path
  end

  context 'コメントを投稿した場合' do
    it 'コメントが新しく表示される',js: true do
      find('.leaflet-marker-icon').click
      click_link event1.title

      fill_in 'このイベントにコメントする？' ,with:'コメントテスト'
      click_on '投稿'
      expect(page).to have_content 'コメントテスト'
    end
  end
end
