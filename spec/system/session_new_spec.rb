require 'rails_helper'

describe "ログイン画面", type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    visit login_path
  end
  context "ログイン成功" do
    it "rootページに遷移" do
      fill_in 'user_email', with: 'hoge@hoge.com'
      fill_in 'user_password', with: 'password'
      click_button "ログインする"
      expect(current_path).to eq root_path
    end
  end
  context "ログイン失敗" do
    it "rootページに遷移" do
      fill_in 'user_email', with: 'hogehoge@hoge.com'
      fill_in 'user_password', with: 'password'
      click_button "ログインする"
      expect(page).to have_content "ログインに失敗しました。"
    end
  end
end