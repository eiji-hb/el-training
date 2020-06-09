require 'rails_helper'

describe "headerからの遷移", type: :system, js: true do
  before do
    visit tasks_path
  end
  context "rootに遷移" do
    it "rootページに遷移" do
      click_link "タスク管理"
      expect(current_path).to eq root_path
    end
  end
  context "新規登録に遷移" do
    it "newページに遷移" do
      click_link "新規登録"
      expect(current_path).to eq new_task_path
    end
  end

end