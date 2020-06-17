require 'rails_helper'

describe "通知", type: :system, js: true do
  before do
    @user = FactoryBot.create(:user,id: 1)
    @task = FactoryBot.create(:task,id: 1, user: @user)
    visit login_path
    fill_in 'user_email', with: 'hoge@hoge.com'
    fill_in 'user_password', with: 'password'
    click_button "ログインする"
    @notification = FactoryBot.create(:notification, task_id: @task.id, user_id: @user.id,checked: false)
  end
  context "通知機能" do
    it "未読の場合" do
      visit current_path
      expect(page).to have_content '★'
    end
    it "既読の場合" do
      click_link "通知"
      expect(page).to have_no_content '★'
    end
  end
end