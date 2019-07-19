require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  include SessionsHelper

  before do
    @user_admin = FactoryBot.create(:user_admin)
    @user_not_admin = FactoryBot.create(:user)
  end

  describe "GET #index" do

    context "login as admin user" do

      it "responds successfully" do
        log_in(@user_admin)
        get :index
        expect(response).to be_success
      end
    end

    context "login as general user" do

      it "responds failly" do
        log_in(@user_not_admin)
        get :index
        expect(response).not_to be_success
      end
    end

    context "not login" do

      it "responds failly" do
        get :index
        expect(response).not_to be_success
      end
    end

  end

  describe "GET #new" do
  end

  describe "GET #new" do
  end

end
