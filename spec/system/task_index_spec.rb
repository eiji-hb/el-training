require 'rails_helper'

describe "index画面からの遷移", type: :system, js: true do
  before do
    @task = FactoryBot.create(:task)
    visit tasks_path
  end
  context "新規登録に遷移" do
    it "newページに遷移" do
      click_link "新規登録"
      expect(current_path).to eq new_task_path
    end
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