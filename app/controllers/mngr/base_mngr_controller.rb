class Mngr::BaseMngrController < ApplicationController

before_filter :adm_auth

protected

def adm_auth
  authenticate_or_request_with_http_basic do |username, password|
    username == "foo" && password == "bar"
  end
  warden.custom_failure! if performed? 
end

end
