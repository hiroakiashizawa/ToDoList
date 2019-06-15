class ApplicationController < ActionController::Base

  def show
    render html:"show"
  end

  def new
    render html:"new"
  end

  def edit
    render html:"edit"
  end
end
