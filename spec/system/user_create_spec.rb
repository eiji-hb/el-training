require 'rails_helper'

describe "ユーザー登録", type: :system, js: true do
  before do
    visit new_admin_user_path
  end
  context '現在のページ確認' do
    it 'newページ' do
      expect(current_path).to eq new_admin_user_path
    end
  end

  context '有効な情報を送信' do
    it 'indexにリダイレクトされる' do
      expect{
        fill_in 'user_name', with: 'hogehogehoge'
        fill_in 'user_email', with: 'hogeeeee@hoge.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button "登録する"
      }.to change{User.count}.by(1)
    end
  end
  context '無効な情報を送信' do
    it '失敗' do
      expect{
        fill_in 'user_name', with: ''
        fill_in 'user_email', with: 'hogeeeee@hoge.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button "登録する"
      }.to change{User.count}.by(0)
      expect(page).to have_css ".error"
    end
  end
end