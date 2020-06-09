require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  describe "有効なuser" do
    it "有効な登録" do
      expect(@user).to be_valid
    end
  end
  describe "無効なname" do
    context "登録失敗" do
      it "nameが無いとき" do
        @user.name = nil
        expect(@user).not_to be_valid
      end
      it "nameが2文字以下のとき" do
        @user.name = "a" * 2
        expect(@user).not_to be_valid
      end
      it "nameが21文字以下のとき" do
        @user.name = "a" * 21
        expect(@user).not_to be_valid
      end
      # it "nameがすでに登録されているとき" do
      #   @user.name = FactoryBot.build(:user,name: "hoge")
      #   expect(@user).not_to be_valid
      # end
    end
  end
  describe "無効なemail" do
    context "登録失敗" do
      it "emailがないとき" do
        @user.email = nil
        expect(@user).not_to be_valid
      end
      # it "emailがすでに登録されているとき" do
      #   @user.email = FactoryBot.build(:user,email: "hoge@hoge.com")
      #   expect(@user).not_to be_valid
      # end
    end
  end
end
