require 'rails_helper'

describe "編集", type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task,user: @user)
    visit login_path
    fill_in 'user_email', with: 'hoge@hoge.com'
    fill_in 'user_password', with: 'password'
    click_button "ログインする"
    visit edit_task_path(@task)
  end
  context '現在のページ確認' do
    it 'editページ' do
      expect(current_path).to eq edit_task_path(@task)
    end
  end

  context '有効な情報を送信' do
    it 'indexにリダイレクトされる' do
      fill_in 'task_name', with: 'testtesttest'
      fill_in 'task_description', with: 'testtesttesttesttesttest'
      click_button "更新する"
      expect(page).to have_content "更新しました。"
      expect(current_path).to eq root_path
    end
  end
  context '無効な情報を送信' do
    it '失敗' do
      fill_in 'task_name', with: ''
      fill_in 'task_description', with: ''
      click_button "更新する"
      expect(page).to have_css ".error"
    end
  end
end