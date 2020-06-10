require 'rails_helper'

describe "ユーザー編集", type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    visit login_path
    fill_in 'user_email', with: 'hoge@hoge.com'
    fill_in 'user_password', with: 'password'
    click_button "ログインする"
    visit edit_admin_user_path(@user)
  end
  context '現在のページ確認' do
    it 'newページ' do
      expect(current_path).to eq edit_admin_user_path(@user)
    end
  end

  context '有効な情報を送信' do
    it 'indexにリダイレクトされる' do
      fill_in 'user_name', with: @user.name
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: 'passwordpassword'
      fill_in 'user_password_confirmation', with: 'passwordpassword'
      click_button "更新する"
    end
  end
  context '無効な情報を送信' do
    it '失敗' do
      fill_in 'user_name', with: ""
      fill_in 'user_email', with: ""
      fill_in 'user_password', with: 'passwordpassword'
      fill_in 'user_password_confirmation', with: 'passwordpassword'
      click_button "更新する"
      expect(page).to have_css ".error"
    end
  end
end