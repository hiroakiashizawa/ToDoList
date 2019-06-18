class TasksController < ApplicationController

  def index
  end
  
  def complete
  end

  def new
    @task = Task.new
  end

  def create
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
  end

  private

    def tasks_params
      params.require(:task).permit(:title, :content)
    end
end
