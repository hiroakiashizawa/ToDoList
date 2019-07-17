class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def index 
    @user = User.find_by(id: current_user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/users', notice: 'User was successfully created.' }
        format.json { render :new, status: :created, location: @user }
      else
        flash.now[:error] = "error"
        format.html { render 'new' }
        format.json { render json: @user.errors }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(users_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    @current_user = nil
    redirect_to root_path
  end

  private

    def users_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def require_login
      unless logged_in?
        flash[:danger] = "Please login!"
        redirect_to login_path
      end
    end
end
