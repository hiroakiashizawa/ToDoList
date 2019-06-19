class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end
  
  def complete
  end

  def new
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @tasks = Task.all
    @task = current_user.tasks.build(tasks_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to '/tasks', notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task }
      else
        # エラーの場合
      end
    end
  end

  def edit
    @tasks = Task.all
  end

  private

    def tasks_params
      params.require(:task).permit(:title, :content)
    end
end
