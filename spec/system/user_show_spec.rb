require 'rails_helper'

describe "ユーザー詳細", type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    visit login_path
    fill_in 'user_email', with: 'hoge@hoge.com'
    fill_in 'user_password', with: 'password'
    click_button "ログインする"
    visit user_path(@user)
  end
  context '現在のページ確認' do
    it 'showページ' do
      expect(current_path).to eq user_path(@user)
    end
  end
  context "編集に遷移" do
    it "editページに遷移" do
      click_link "編集"
      expect(current_path).to eq edit_user_path(@user)
    end
  end
  context "遷移" do
    it "ユーザーを消去" do
      click_link "消去"
      expect(page.accept_confirm).to eq "本当に削除しますか？"
      expect{
        expect(page).to have_content "消去しました。"
        }.to change{User.count}.by(-1)
    end
  end
end