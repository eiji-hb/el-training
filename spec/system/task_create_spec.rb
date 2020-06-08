require 'rails_helper'

describe "新規登録", type: :system, js: true do
  before do
    visit new_task_path
  end
  context '現在のページ確認' do
    it 'newページ' do
      expect(current_path).to eq new_task_path
    end
  end
  context "indexに遷移" do
    it '一覧ボタンを押す' do
      click_link "一覧"
      expect(current_path).to eq tasks_path
    end
  end
  context '有効な情報を送信' do
    it 'indexにリダイレクトされる' do
      expect{
        fill_in 'task_name', with: 'testtesttest'
        fill_in 'task_description', with: 'testtesttesttesttesttest'
        click_button "Create Task"
      }.to change{Task.count}.by(1)
    end
  end
  context '無効な情報を送信' do
    it '失敗' do
      expect{
        fill_in 'task_name', with: ''
        fill_in 'task_description', with: ''
        click_button "Create Task"
      }.to change{Task.count}.by(0)
      expect(page).to have_css ".error"
    end
  end
end