class ProjectsController < ApplicationController

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
        format.js { rneder json: @project.errors }
      end
    end 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def project_params
      params.require(:projects).permit(:project_name, :user_id)
    end
end
