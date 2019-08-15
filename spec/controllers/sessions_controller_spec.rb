require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  include SessionsHelper

  let(:user) { FactoryBot.create(:user) }
  let(:valid_parameters) do
    { email: user.email, password: user.password }
  end

  describe "GET #index" do

    it "responds successfully" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #new" do

    it "responds successfully" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST #create" do

    context "as admin user" do
      let(:user_admin) { FactoryBot.create(:user_admin) }
      let(:valid_admin_parameters) do
        { email: user_admin.email, password: user_admin.password }
      end

      it "success to log in" do
        post :create, params: { session: valid_admin_parameters }
        expect(session[:user_id]).to eq user_admin.id
      end

      it "redirectes to tasks/index page" do
        post :create, params: { session: valid_admin_parameters }
        expect(response).to redirect_to '/admin'
      end
    end


    context "as correct user" do

      it "success to log in" do
        post :create, params: { session: valid_parameters }
        expect(session[:user_id]).to eq user.id
      end

      it "redirectes to tasks/index page" do
        post :create, params: { session: valid_parameters }
        expect(response).to redirect_to root_url
      end
    end

    context "as invalid user for wrong email" do
      let(:invalid_email) do
        { email: "invalid@email.com", password: user.password }
      end

      it "is failed to log in from invalid email" do
        post :create, params: { session: invalid_email }
        expect(session[:user_id]).not_to eq user.id
      end

      it "redirectes to login/new page" do
        post :create, params: { session: invalid_email }
        expect(response).to render_template(:new)
      end
    end

    context "as invalid user for wrong password" do
      let(:invalid_password) do
        { email: user.email, password: "invalid" }
      end

      it "is failed to log in from invalid email" do
        post :create, params: { session: invalid_password }
        expect(session[:user_id]).not_to eq user.id
      end

      it "redirectes to login/new page" do
        post :create, params: { session: invalid_password }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do

    it "success to log out" do
      log_in(user)
      delete :destroy, params: { id: user.id }
      expect(session[:user_id]).to eq nil
    end

    it "redirectes to login/index page" do
      log_in(user)
      delete :destroy, params: { id: user.id }
      expect(response).to redirect_to '/login/index'
    end
  end

  describe "POST #login_as_guest" do
    let(:user_as_guest) { FactoryBot.create(:user_as_guest) }

    it "success to Guest-Login" do
      post :login_as_guest, params: { id: user_as_guest.id }
      expect(session[:user_id]).to eq user_as_guest.id
    end

    it "redirectes to tasks/index page" do
      post :login_as_guest, params: {id: user_as_guest.id }
      expect(response).to redirect_to root_url
    end
  end
end
