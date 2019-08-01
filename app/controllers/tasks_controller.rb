class TasksController < ApplicationController
  before_action :require_login

  def index
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: false).paginate(page: params[:page], per_page: 5)
  end

  def new
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: false).paginate(page: params[:page], per_page: 5)
    @task = Task.new
  end

  def create
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: false).paginate(page: params[:page], per_page: 5)
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
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: false).paginate(page: params[:page], per_page: 5)
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(tasks_params)
      redirect_to root_path, flash: { success: "Success to be updated" }
    end
  end

  def completed
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: true).paginate(page: params[:page], per_page: 5)
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
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(deleted: true).paginate(page: params[:page], per_page: 5)
  end

  def pre_destroy
    @task = Task.find(params[:id])
    is_deleted = @task.deleted
    if @task.update_attributes(deleted: !is_deleted)
      if status(@task) == 'deleted'
        redirect_to deleted_tasks_path, flash: { success: "Success to destroy" }
      else
        redirect_to root_path, flash: { success: "Success to Restore!!" }
      end
    end
  end

  def destroy
    if Task.find(params[:id]).destroy!
      redirect_to deleted_tasks_path, flash: { success: "Task completelly destroy!!" }
    end
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
