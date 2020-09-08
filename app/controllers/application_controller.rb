class ApplicationController < ActionController::Base
  include Pundit

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end
end
