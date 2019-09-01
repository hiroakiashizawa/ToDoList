require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  include SessionsHelper

  let(:user) { FactoryBot.create(:user_anti_dup_email) }

  describe 'GET #index' do

    context "when logged in" do

      it "responds successfully" do
        log_in(user)
        get :index
        expect(response).to be_successful
      end
    end

    context "when not logged in" do

      it "responds not successfully" do
        get :index
        expect(response).not_to be_successful
      end
    end
  end

  describe 'GET #new' do

    context "when logged in" do

      it "responds successfully" do
        log_in(user)
        get :new
        expect(response).to be_successful
      end
    end

    context "when not logged in" do

      it "responds not successfully" do
        get :new
        expect(response).not_to be_successful
      end
    end
  end

  describe 'GET #edit' do
    let(:project) { FactoryBot.create(:project) }


    context "when logged in" do

      it "responds successfully" do
        log_in(user)
        get :edit, params: { id: project.id } 
        expect(response).to be_successful
      end
    end

    context "when not logged in" do

      it "responds not successfully" do
        get :edit, params: { id: project.id } 
        expect(response).not_to be_successful
      end
    end
  end

  describe 'PATCH #update' do

    before do
      @project = FactoryBot.create(:project, user_id: user)
    end

    let(:project_params) { FactoryBot.attributes_for(:project, project_name: "all") }

    context "when logged in" do

      it "updates successfully" do
        log_in(user)
        patch :update, params: { id: @project.id, project: project_params }
        expect(@project.reload.project_name).to eq "all"
      end
    end

    context "when not logged in" do

      it "updates not successfully" do
        patch :update, params: { id: @project.id, projects: { project_name: "all"} } 
        expect(@project.reload.project_name).not_to eq "all"
      end
    end
  end

  describe 'DELETE #destroy' do

    before do
      @project = FactoryBot.create(:project, user_id: user)
    end

    let(:delete_request) { delete :destroy, params: { id: @project.id, project: @project } }

    context "when logged in" do

      it "is deleted successfully" do
        log_in(user)
        expect{ delete_request }.to change(Project, :count)
      end
    end

    context "when not logged in" do

      it "is deleted not successfully" do
        expect{ delete_request }.not_to change(Project, :count)
      end
    end
  end
end
