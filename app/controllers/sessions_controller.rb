class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      if user.admin
        redirect_to admin_url
      else
        redirect_to root_url
      end
    else
      flash.now[:danger] = "invalid email/password, failed to login"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_index_path
  end

  def login_as_guest
    guest = User.find_by(email: "guest@todo.com")
    log_in guest
    redirect_to root_url
  end
end
