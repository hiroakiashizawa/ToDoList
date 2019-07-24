class ApplicationController < ActionController::Base
  include TasksHelper
  include SessionsHelper
  include AdminHelper
  before_action :search_tasks

  def search_tasks
    @search = current_user.tasks.all.ransack(params[:q])
    @search_tasks = @search.result
  end
end
