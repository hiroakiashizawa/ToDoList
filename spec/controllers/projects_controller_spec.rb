require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  include SessionsHelper

  describe 'GET #index' do
    let(:user) { FactoryBot.create(:user_anti_dup_email) }

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

  describe 'GET #new' do
    let(:user) { FactoryBot.create(:user_anti_dup_email) }

    context "when logged in" do

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

  describe 'GET #edit' do
    let(:user) { FactoryBot.create(:user_anti_dup_email) }
    let(:project) { FactoryBot.create(:project) }


    context "when logged in" do

      it "responds successfully" do
        log_in(user)
        get :edit, params: { id: project.id } 
        expect(response).to be_success
      end
    end

    context "when not logged in" do

      it "responds not successfully" do
        get :edit, params: { id: project.id } 
        expect(response).not_to be_success
      end
    end
  end

  describe 'PATCH #update' do

    before do
    end

    let(:user) { FactoryBot.create(:user_anti_dup_email) }
    let(:project) { FactoryBot.create(:project, user_id: user) }
    let(:project2) { FactoryBot.create(:project2) }
    let(:project_params) { FactoryBot.attributes_for(:project, user: user) }

    context "when logged in" do

      it "updates successfully" do
        log_in(user)
        patch :update, params: { id: project.id, project: project_params }
        expect(project.reload.project_name).to eq "all"
        binding.pry
      end
    end

    context "when not logged in" do

      it "updates not successfully" do
        patch :update, params: { id: project.id, projects: { project_name: "all"} } 
        expect(project.reload.project_name).not_to eq "all"
      end
    end
  end

  describe 'DELETE #destroy' do

    before do
      @project = FactoryBot.create(:project)
    end

    let(:user) { FactoryBot.create(:user_anti_dup_email) }
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
