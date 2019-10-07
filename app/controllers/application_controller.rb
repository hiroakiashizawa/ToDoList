class ApplicationController < ActionController::Base
  include TasksHelper
  include SessionsHelper
  include AdminHelper
  before_action :set_admin

  def set_admin
    @user_project = current_user.projects.all if logged_in?
  end
end
