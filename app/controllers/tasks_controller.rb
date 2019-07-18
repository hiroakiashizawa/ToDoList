class TasksController < ApplicationController
  before_action :require_login

  def index
    if current_user
      @tasks = current_user.tasks.all
    end
  end
  
  def complete
    @tasks = Task.all
  end

  def new
    @tasks = current_user.tasks.all
    @task = Task.new
  end

  def create
    @tasks = current_user.tasks.all
    @task = current_user.tasks.build(tasks_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to '/tasks', notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task }
      else
        flash.now[:error] = "error"
        format.html { render 'new' }
        format.json { render json: @task.errors }
      end
    end
  end

  def edit
    @tasks = current_user.tasks.all
    @task = Task.find(params[:id])
  end

  def update
    @tasks = current_user.tasks.all
    @task = Task.find(params[:id])
    if @task.update_attributes(tasks_params)
      #flash[:success] = "task updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to root_path
  end

  private

    def tasks_params
      params.require(:task).permit(:title, :content, :timelimit, :completed, :user_id)
    end

    def require_login
      unless logged_in?
        flash[:danger] = "Please login!"
        redirect_to login_path
      end
    end
end
