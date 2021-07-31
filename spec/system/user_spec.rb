require 'rails_helper'

RSpec.describe 'ユーザー機能', type: :system do
  describe 'アカウント登録' do
    before do
      visit new_user_session_path
      click_link 'アカウント登録'
      fill_in '名前', with:'testuser'
      fill_in 'メールアドレス', with:'testuser@test.com'
      fill_in 'パスワード', with:'password'
      fill_in 'パスワード（確認用）', with:'password'
      click_button 'アカウント登録'
    end

    it 'ログアウトボタンが表示される' do
      expect(page).to have_selector 'a', text:'ログアウト'
    end
  end
  describe '管理ページ機能' do
    let!(:admin_user){ FactoryBot.create(:admin_user)}
    let!(:normal_user){ FactoryBot.create(:user2)}

    context '管理者がアクセスした場合' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with:'admin_user@test.com'
        fill_in 'パスワード', with:'password'
        click_button 'ログイン'
      end
      it '管理者ページに遷移できる' do
        visit rails_admin_path
        expect(page).to have_selector 'h1',text:'サイト管理'
      end
    end

    context '通常ユーザーがアクセスした場合' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with:'user2@test.com'
        fill_in 'パスワード', with:'password'
        click_button 'ログイン'
      end
      it 'エラーメッセージが表示される' do
        visit rails_admin_path
        expect(page).to have_selector 'p',text:'アクセス権限がありません'
      end
    end


  end
end
