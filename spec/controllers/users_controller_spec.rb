require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include SessionsHelper

  let(:user) { FactoryBot.create(:user) }

  describe "GET #index" do

    it "responds successfully" do
      log_in(user)
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:user_params) { FactoryBot.attributes_for(:user) }

    it "add a user" do
      expect {
        post :create, params: { user: user_params }
      }.to change{ User.count }.by(1)
    end

    it "redirectes to users/index page" do
      post :create, params: { user: user_params }
      expect(response).to redirect_to "/users"
    end
  end

  describe "PATCH #update" do
    let(:user_params) { FactoryBot.attributes_for(:user, name: "hiroaki") }

    it "update a user" do
      log_in(user)
      patch :update, params: { id: user.id, user: user_params }
      expect(user.reload.name).to eq "hiroaki"
    end
  end

  describe "DELETE #destroy" do

    it "destroy a user" do
      log_in(user)
      expect {
        delete :destroy, params: { id: user.id }
      }.to change{ User.count }.by(-1)
    end
  end

end
