require "application_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # responders gem
  self.responder = ApplicationResponder
  respond_to :html
  
  def after_sign_in_path_for(resource)
    dashboard_url
  end
  
end
