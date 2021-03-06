require 'rails_helper'

describe "index画面からの遷移", type: :system, js: true do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task,id:1,user: @user)
    @task1 = FactoryBot.create(:task1,id:2)
    @task2 = FactoryBot.create(:task2,id:3)
    @task3 = FactoryBot.create(:task3,id:4)
    visit login_path
    fill_in 'user_email', with: 'hoge@hoge.com'
    fill_in 'user_password', with: 'password'
    click_button "ログインする"
    visit tasks_path
  end
  context "編集に遷移" do
    it "editページに遷移" do
      click_link "編集",match: :first
      expect(current_path).to eq edit_task_path(@task)
    end
  end
  context "遷移" do
    it "タスクを消去" do
      click_link "消去",match: :first
      expect(page.accept_confirm).to eq "本当に削除しますか？"
      expect{
        expect(page).to have_content "消去しました。"
        }.to change{Task.count}.by(-1)
    end
  end
  context "並び替え" do
    it "order(created_at: :desc)の順" do
      expect(Task.order("created_at DESC").map(&:id)).to eq [4,3,2,1]
    end
  end
  context "deadline 並び替え" do
    it "昇順になる" do
      expect(Task.order("deadline ASC").map(&:id)).to eq [1,2,3,4]
    end
    it "降順になる" do
      expect(Task.order("deadline DESC").map(&:id)).to eq [4,3,2,1]
    end
  end
  context "priority 並び替え" do
    it "昇順になる" do
      expect(Task.order("priority ASC").map(&:id)).to eq [3,4,2,1]
    end
    it "降順になる" do
      expect(Task.order("priority DESC").map(&:id)).to eq [1,2,3,4]
    end
  end
  context "検索" do
    before do
      @taglist = FactoryBot.create(:taglist1)
      @tag_table = FactoryBot.create(:tag_table1,taglist: @taglist,task: @task)
    end
    it "タイトルと一致するのを検索" do
      select 'タイトル', from: 'select'
      fill_in 'q',with: 'MyText'
      click_button "検索"
      expect(page).to have_selector 'td', text: 'MyText'
    end
    it "ステータスと一致するのを検索" do
      select 'ステータス', from: 'select'
      fill_in 'q',with: '未着手'
      click_button "検索"
      expect(page).to have_selector 'td', text: '未着手'
    end
    it "ラベルと一致するのを検索" do
      select 'ラベル', from: 'select'
      fill_in 'q',with: 'aaa'
      click_button "検索"
      expect(page).to have_selector 'td', text: 'aaa'
    end
  end
end