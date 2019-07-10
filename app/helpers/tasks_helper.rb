module TasksHelper
  def owner(task)
    id = task.user_id
    user = User.find(task.user_id)
    @owner = user.name
  end
end
