class ApplicationController < ActionController::Base
  skip_forgery_protection

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authorize_admin!
    redirect_to root_path, alert: 'Access Denied' unless current_user&.admin?
  end
  
  protected

  def configure_permitted_parameters
    # Allow :login for sign-in
    devise_parameter_sanitizer.permit(:sign_in, keys: [:login])
    # Allow user_name and email for sign-up and account update
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :email])
  end

end
