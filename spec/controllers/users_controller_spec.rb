require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include SessionsHelper

  describe "#index" do

    before do
      @user = FactoryBot.create(:user)
    end

    it "responds successfully" do
      log_in(@user)
      get :index
      expect(response).to be_success
    end
  end

  describe '#create' do

    it "add a user" do
      users_params = FactoryBot.attributes_for(:user)
      expect {
        post :create, params: { user: users_params }
      }.to change{ User.count }.by(1)
    end

    it "redirectes to users/index page" do
      users_params = FactoryBot.attributes_for(:user)
      post :create, params: { user: users_params }
      expect(response).to redirect_to "/users"
    end
  end

  describe "#update" do

    before do
      @user = FactoryBot.create(:user)
    end

    it "update a user" do
      log_in(@user)
      users_params = FactoryBot.attributes_for(:user, name: "hiroaki")
      patch :update, params: { id: @user.id, user: users_params }
      expect(@user.reload.name).to eq "hiroaki"
    end
  end

  describe "#destroy" do

    before do
      @user = FactoryBot.create(:user)
    end

    it "destroy a user" do
      log_in(@user)
      expect {
        delete :destroy, params: { id: @user.id }
      }.to change{ User.count }.by(-1)
    end
  end

end
