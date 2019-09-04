class ProjectsController < ApplicationController
  before_action :require_login

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = current_user.projects.all
  end

  def new
  end

  def create
    @project = current_user.projects.build(project_params)
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, flash: { success: "Project was successfully created" } }
        format.js { render :index, status: :created, location: @project }
      else
        flash.now[:danger] = "Create project was failed"
        format.html { render 'new' }
        format.js { reeder json: @project.errors }
      end
    end 
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      redirect_to projects_path, flash: { success: "Project was successfully updated!!" }
    end
  end

  def destroy
    if @project = Project.find(params[:id]).destroy!
      redirect_to projects_path, flash: { danger: "Task completelly destroy!!" }
    end
  end

  private

    def project_params
      params.require(:projects).permit(:project_name, :user_id)
    end

    def require_login
      unless logged_in?
        flash[:danger] = "Please login!"
        redirect_to login_path
      end
    end
end
