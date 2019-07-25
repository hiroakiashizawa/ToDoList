module TasksHelper
  def owner(task)
    id = task.user_id
    user = User.find(task.user_id)
    @owner = user.name
  end

  def search_tasks
    @search = current_user.tasks.all.ransack(params[:q])
    @search_tasks = @search.result
  end
end
