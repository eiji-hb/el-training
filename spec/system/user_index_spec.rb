require 'rails_helper'

describe "ユーザー一覧", type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    visit login_path
    fill_in 'user_email', with: 'hoge@hoge.com'
    fill_in 'user_password', with: 'password'
    click_button "ログインする"
    visit admin_users_path
  end
  context '現在のページ確認' do
    it 'showページ' do
      expect(current_path).to eq admin_users_path
    end
  end
  context "ユーザー詳細に遷移" do
    it "editページに遷移" do
      find('#username').click
      expect(current_path).to eq admin_user_path(@user)
    end
  end

  context "権限変更" do
    before do
      @user1 = FactoryBot.create(:user1)
      @user2 = FactoryBot.create(:user2)
      @user3 = FactoryBot.create(:user3)
    end
    it "一般に変更する" do
      click_button "一般に変更する"
      expect(@user.admin).to eq "admin"
    end
  end
  context "権限変更できない" do
    it "管理者人数をゼロにさせない" do
      click_button "一般に変更する"
      expect(page).to have_content "管理者がいなくなります。"
    end
  end

  context "編集に遷移" do
    it "editページに遷移" do
      click_link "編集",match: :first
      expect(current_path).to eq edit_admin_user_path(@user)
    end
  end
  context "遷移" do
    it "タスクを消去" do
      click_link "消去",match: :first
      expect(page.accept_confirm).to eq "本当に削除しますか？"
      expect{
        expect(page).to have_content "消去しました。"
        }.to change{User.count}.by(-1)
    end
  end
end