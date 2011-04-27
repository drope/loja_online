class ApplicationController < ActionController::Base

  protect_from_forgery
  include CartHelper
  include ApplicationHelper
  
end
