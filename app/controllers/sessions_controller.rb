class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.password
      
    else
      render 'edit'
    end
  end

  def delete
  end
end
