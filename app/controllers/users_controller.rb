class UsersController < ApplicationController

  def index
    @users = User.all
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

  private

    def users_params
      params.require(:user).permit(:name, :email)
    end
end
