module AdminHelper

  def search_tasks
    @search = current_user.tasks.all.ransack(params[:q])
    @search_tasks = @search.result
  end
end
