class TasksController < ApplicationController
    
  include Common
  before_action :require_login

  def index
    @tasks = task_common
  end

  def new
  end

  def create
    @task = current_user.tasks.build(tasks_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path , flash: { success: "Task was successfully created" } }
        format.json { render :index, status: :created, location: @task }
      else
        flash.now[:danger] = "Create task was failed"
        format.html { render 'new' }
        format.json { render json: @task.errors }
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(tasks_params)
      redirect_to root_path, flash: { success: "Success to be updated" }
    end
  end

  def completed
    @tasks = task_common('completed')
  end

  def edit_completed
    @task = Task.find(params[:id])
    is_completed = @task.completed
    if @task.update_attributes(completed: !is_completed)
      if status(@task) == 'completed'
        redirect_to completed_tasks_path, flash: { success: "Success to change completed" }
      else
        redirect_to root_path, flash: { success: "Success to change incompleted" }
      end
    end
  end

  def deleted
    @tasks = task_common('deleted')
  end

  def pre_destroy
    @task = Task.find(params[:id])
    is_deleted = @task.deleted
    if @task.update_attributes(deleted: !is_deleted)
      if status(@task) == 'deleted'
        redirect_to deleted_tasks_path, flash: { danger: "Success to destroy" }
      else
        redirect_to root_path, flash: { success: "Success to Restore!!" }
      end
    end
  end

  def destroy
    if Task.find(params[:id]).destroy!
      redirect_to deleted_tasks_path, flash: { danger: "Task completelly destroy!!" }
    end
  end

  def search
    @tasks = task_common
    @search = @tasks.ransack(params[:q])
    @search_tasks = @search.result
  end

  private

    def tasks_params
      params.require(:task).permit(:title, :content, :timelimit, :completed, :deleted, :user_id)
    end

    def require_login
      unless logged_in?
        flash[:danger] = "Please login!"
        redirect_to login_path
      end
    end
end
