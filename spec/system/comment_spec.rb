require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do
  let!(:user_1){ FactoryBot.create(:user) }
  let!(:category_1){ FactoryBot.create(:category1) }
  let!(:category_2){ FactoryBot.create(:category2) }
  # let!(:event1){ FactoryBot.create(:event, user_id: user_1.id, categories:[category_1] )}
  context 'コメントを投稿した場合' do
    it 'コメントが新しく表示される',js: true do
      event1 = FactoryBot.create(:event, categories:[category_1], user: user_1 )
      visit new_user_session_path
      fill_in 'メールアドレス', with:'user1@test.com'
      fill_in 'パスワード', with:'password'
      click_button 'ログイン'
      visit events_path
      find('.leaflet-marker-icon').click
      click_link event1.title
      fill_in 'このイベントにコメントする？' ,with:'コメントテスト'
      click_on '投稿'
      expect(page).to have_content 'コメントテスト'
    end
  end
end
