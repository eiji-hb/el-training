require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.create(:task)
  end
  describe '投稿が有効なとき' do
    it '有効な投稿検証' do
      expect(@task).to be_valid
    end
  end
  describe '投稿が無効な場合' do
    context '内容が無効な場合' do
      it 'nameが存在しないとき' do
        @task.name = nil
        expect(@task).not_to be_valid
      end
      it 'descriptionが存在しないとき' do
        @task.description = nil
        expect(@task).not_to be_valid
      end
      it 'deadlineが存在しないとき' do
        @task.deadline = nil
        expect(@task).not_to be_valid
      end
    end
  end
end
