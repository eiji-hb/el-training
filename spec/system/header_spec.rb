require 'rails_helper'

describe "headerからの遷移", type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    visit tasks_path
  end
  context "ログイン済の場合" do
    before do
      visit login_path
      fill_in 'user_email', with: 'hoge@hoge.com'
      fill_in 'user_password', with: 'password'
      click_button "ログインする"
    end
    it "rootページに遷移" do
      click_link "タスク管理"
      expect(current_path).to eq root_path
    end
    it "タスク作成に遷移" do
      click_link "タスク作成"
      expect(current_path).to eq new_task_path
    end
    it "ユーザー一覧に遷移" do
      click_link "ユーザー一覧"
      expect(current_path).to eq admin_users_path
    end
    it "ユーザーを押す" do
      find('#user-link').click
      expect(current_path).to eq admin_user_path(@user)
    end
    it "ログアウトに遷移" do
      click_link "ログアウト"
      expect(current_path).to eq login_path
      expect(page).to have_content 'ログアウトしました'
    end
  end
  context "ログイン前の場合" do
    it "rootページに遷移" do
      click_link "タスク管理"
      expect(current_path).to eq root_path
    end
    it "ユーザー登録画面遷移" do
      click_link "ユーザー登録"
      expect(current_path).to eq new_admin_user_path
    end
    it "ログイン画面に遷移" do
      click_link "ログイン"
      expect(current_path).to eq login_path
    end
  end

end