class AdminController < ApplicationController
  before_action :require_login, :require_admin

  def index
    @tasks = Task.all.order(updated_at: 'DESC').paginate(page: params[:page], per_page: 5)
    @graf = Task.all
  end

  def users_show
    @users = User.all.paginate(page: params[:page], per_page: 15)
  end

  def tasks_show
    @tasks = Task.all.paginate(page: params[:page], per_page: 15)
  end

  private

    def require_login
      unless logged_in?
        flash[:danger] = "Please login!"
        redirect_to login_path
      end
    end

    def require_admin
      unless current_user.admin
        flash[:danger] = "Please login by admin user!"
        redirect_to root_path
      end
    end
end
