require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
    @user_no_name = FactoryBot.build(:user_no_name)
    @user_no_email = FactoryBot.build(:user_no_email)
  end

  describe 'validation' do

    it "is valid with a name, email" do
      expect(@user).to be_valid
    end

    it "is invalid without a name" do
      @user_no_name.valid?
      expect(@user_no_name.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an email address" do
      @user_no_email.valid?
      expect(@user_no_email.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      ## ユーザ保存
      @user.save
      ## emailが重複しているユーザを登録
      @user_dup_email = FactoryBot.build(:user_dup_email)
      @user_dup_email.valid?
      expect(@user_dup_email.errors[:email]).to include("has already been taken")
    end
  end
end