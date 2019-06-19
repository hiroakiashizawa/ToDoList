class UserController < ApplicationController
  def show
    User.all
  end
end
