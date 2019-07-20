require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validation' do
    let(:user) { FactoryBot.build(:user) }
    let(:user_no_name) { FactoryBot.build(:user_no_name) }
    let(:user_no_email) { FactoryBot.build(:user_no_email) }
    let(:user_dup_email) { FactoryBot.build(:user_dup_email) }

    it "is valid with a name, email" do
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user_no_name.valid?
      expect(user_no_name.errors[:name]).to include("can't be blank")
    end

    it "is invalid without an email address" do
      user_no_email.valid?
      expect(user_no_email.errors[:email]).to include("can't be blank")
    end

    it "is invalid with a duplicate email address" do
      user.save
      user_dup_email.save
      user_dup_email.valid?
      expect( user_dup_email.errors[:email]).to include("has already been taken")
    end
  end
end