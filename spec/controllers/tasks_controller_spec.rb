require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  include SessionsHelper

  before do
    @user = FactoryBot.create(:user)
  end

  describe "GET #index" do

    context "when logged in" do

      it "responds successfully" do
        log_in(@user)
        get :index
        expect(response).to be_success
      end
    end

    context "when not logged in" do

      it "responds not successfully" do
        get :index
        expect(response).not_to be_success
      end
    end

  end

  describe "GET #complete" do

    context "when logged-in" do

      it "responds successfully" do
        log_in(@user)
        get :complete
        expect(response).to be_success
      end  
    end
    
    context "when not logged in" do

      it "responds not successfully" do
        get :complete
        expect(response).not_to be_success
      end
    end

  end

  describe "GET #new" do

    context "when logged-in" do

      it "responds successfully" do
        log_in(@user)
        get :new
        expect(response).to be_success
      end
    end

    context "when not logged in" do

      it "responds not successfully" do
        get :new
        expect(response).not_to be_success
      end
    end

  end

  describe "POST #create" do
    let(:task_params) { FactoryBot.attributes_for(:task, user: @user) }
    
    context "when logged-in" do

      it "success to add a task" do
        log_in(@user)
        expect{
          post :create, params: { task: task_params }
        }.to change{ Task.count }.by(1)
      end
  
      it "redirects to tasks/index page" do
        log_in(@user)
        post :create, params: { task: task_params }
        expect(response).to redirect_to "/tasks"
      end

    end

    context "when not logged-in" do

      it "fails to add a task" do
        expect{
          post :create, params: { task: task_params }
        }.to change{ Task.count }.by(0)
      end

      it "redirects to tasks/new page" do
        post :create, params: { task: task_params }
        expect(response).to redirect_to '/login'
      end

    end
  end
end