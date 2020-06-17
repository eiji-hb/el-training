require 'rails_helper'

describe "show画面からの遷移", type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task,user: @user)
    visit login_path
    fill_in 'user_email', with: 'hoge@hoge.com'
    fill_in 'user_password', with: 'password'
    click_button "ログインする"
    visit task_path(@task)
  end
  context "編集に遷移" do
    it "editページに遷移" do
      click_link "編集"
      expect(current_path).to eq edit_task_path(@task)
    end
  end
  context "遷移" do
    it "タスクを消去" do
      click_link "消去"
      expect(page.accept_confirm).to eq "本当に削除しますか？"
      expect{
        expect(page).to have_content "消去しました。"
        }.to change{Task.count}.by(-1)
    end
  end
end