class AdminController < ApplicationController
  def index
  end

  def users_show
    @users = User.all
  end

  def tasks_show
    @tasks = Task.all
  end
end
