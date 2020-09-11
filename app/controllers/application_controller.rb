class ApplicationController < ActionController::Base
  include Pundit

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    render json: {message: 'not authorized', error: exception}, status: :forbidden
  end
end
