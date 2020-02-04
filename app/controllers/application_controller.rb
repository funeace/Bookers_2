class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
  end

  #ログイン後のリダイレクト先を明示的に変更する　pathを指定することで、変更できる
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
end
