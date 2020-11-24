class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  
  
  def after_sign_in_path_for(resource)
    lists_path # ログイン後に遷移するpathを設定
  end
  
  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end
  
  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    devise_parameter_sanitizer.permit(:sign_in,keys:[:name])

  end
end
