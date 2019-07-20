require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  include SessionsHelper

  let(:user) { FactoryBot.create(:user_anti_dup_email) }

  describe "GET #index" do

    context "when logged in" do

      it "responds successfully" do
        log_in(user)
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
        log_in(user)
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
        log_in(user)
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
    let(:task_params) { FactoryBot.attributes_for(:task, user: user) }
    
    context "when logged-in" do

      it "successes to add a task" do
        log_in(user)
        expect{
          post :create, params: { task: task_params }
        }.to change{ Task.count }.by(1)
      end
  
      it "redirects to tasks/index page" do
        log_in(user)
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

      it "redirects to login page" do
        post :create, params: { task: task_params }
        expect(response).to redirect_to '/login'
      end

    end
  end

  describe "PATCH #complete" do
    let(:task_params) { FactoryBot.attributes_for(:task, user: user) }

    context "when logged-in" do

      it "successes to do task completed" do
      end

      it "redirects to tasks/index page" do
      end
    end

    context "when not logged-in" do
    
      it "fails to do task completed" do
      end

      #it "redirects to login page" do
      #  update 
      #  expect(response).to redirect_to '/login'
      #end
    end
  end

  describe "PATCH #update" do
    let(:task) { FactoryBot.create(:task) }
    let(:task_params) { FactoryBot.attributes_for(:task, completed: true) }

    context "when logged-in" do

      it "successes to do task completed" do
        log_in(user)
        patch :update, params: { id: task.id, task: task_params}
        expect(task.reload.completed).to eq true
      end

      it "redirects to tasks/index page" do
        log_in(user)
        patch :update, params: { id: task.id, task: task_params }
        expect(response).to redirect_to root_path
      end
    end

    context "when not logged-in" do
    
      it "fails to do task completed" do
        patch :update, params: { id: task.id, task: task_params}
        expect(task.reload.completed).not_to eq true
      end

      it "redirects to login page" do
        patch :update, params: { id: task.id, task: task_params }
        expect(response).to redirect_to '/login'
      end
    end
  end


  ## DELETEテストは保留 ##
  # describe "DELETE #destroy" do

  #   context "when logged-in" do
  #     let(:task) { FactoryBot.create(:task) }

  #     it "successes to delete a task" do
  #       log_in(user)
  #       delete :destroy, params: { id: task.id }
  #       ##モーダルでconfirm画面出してるせいでうまくいかん
  #       expect(task).to eq nil
  #     end

  #     it "redirects to tasks/index page" do
  #       log_in(user)
  #       delete :destroy, params: { id: task.id }
  #       ##モーダルでconfirm画面出してるせいでうまくいかん
  #       expect(response).to redirect_to root_path
  #     end
  #   end

  #   context "when not logged-in" do
  #     let(:task) { FactoryBot.create(:task) }
    
  #     it "fails to delete task" do
  #       expect {
  #         delete :destroy, params: { id: task.id }
  #       }.to change{ Task.count }.by(0)
  #     end

  #     it "redirects to login page" do
  #       delete :destroy, params: { id: task.id }
  #       expect(response).to redirect_to '/login'
  #     end
  #   end
  # end
end