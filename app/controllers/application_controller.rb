class ApplicationController < ActionController::Base
  include TasksHelper
  include SessionsHelper
  include AdminHelper
end
