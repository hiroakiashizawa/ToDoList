class TasksController < ApplicationController
  before_action :require_login

  def index
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: false)
  end

  def new
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: false)
    @task = Task.new
  end

  def create
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: false)
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
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: false)
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(tasks_params)
      flash[:success] = "task updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def completed
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: true)
  end

  def edit_completed
    @task = Task.find(params[:id])
    is_completed = @task.completed
    @task.update_attributes(completed: !is_completed)
    redirect_to root_path
  end

  def deleted
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(deleted: true)
  end

  def pre_destroy
    @task = Task.find(params[:id])
    is_deleted = @task.deleted
    @task.update_attributes(deleted: !is_deleted)
    redirect_to root_path
  end

  def destroy
    Task.find(params[:id]).destroy!
    redirect_to deleted_tasks_path
  end

  def task_status
  end

  private

    def tasks_params
      params.require(:task).permit(:title, :content, :timelimit, :complete, :user_id)
    end

    def require_login
      unless logged_in?
        flash[:danger] = "Please login!"
        redirect_to login_path
      end
    end
end
