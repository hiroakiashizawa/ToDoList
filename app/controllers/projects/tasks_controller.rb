class Projects::TasksController < ApplicationController

  def show
    @project = Project.find(params[:project_id])
    @task = @project.tasks.where(params[:id])
    binding.pry
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
end
