module TasksHelper
  def owner(task)
    id = task.user_id
    user = User.find(task.user_id)
    @owner = user.name
  end

  def search_tasks
    @tasks = current_user.tasks.all.order(timelimit: 'DESC').where(completed: false, deleted: false).paginate(page: params[:page], per_page: 5)
    @search = @tasks.ransack(params[:q])
    @search_tasks = @search.result
  end

  def status(task)
    if task.deleted
      return 'deleted'
    elsif task.completed
      return 'completed'
    else
      return 'neutral'
    end
  end
end
