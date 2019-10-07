class Projects::TasksController < ApplicationController

  before_action :require_login

  def show
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def require_login
      unless logged_in?
        flash[:danger] = "Please login!"
        redirect_to login_path
      end
    end
end
