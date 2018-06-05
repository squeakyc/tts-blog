class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # actions include page loads, so it's going to authenticate before it does ANYTHING. Can be refined - ask Cole how
  before_action :configure_permitted_parameters, if: :devise_controller?
  # this before action only runs if your are a devise controller
  protected
  # protected will apply to every method after it.
  # by default, all ruby methods are public, so they can be accessed throughout the program
  # only called from inside this class & it's subclasses - using private instead means it's only called from inside this class.

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])

    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
  end
end
