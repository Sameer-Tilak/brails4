class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      'admin'
    else
      'application'
    end
  end

  def is_admin
    current_user.admin? if current_user
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_levels_path
    else
      user_path(current_user)
    end
  end
end
