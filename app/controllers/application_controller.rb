class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_any!

  def authenticate_any!
    if request.path.match(/\/admin(\/)?/) # (管理者側のログイン制限)urlがadminの判定
      authenticate_admin!
    elsif controller_name != 'items' && controller_name != 'homes' # (顧客側のログイン制限)itemsコントローラー,homesコントローラー以外
      authenticate_customer!
    end
  end

  

  
  #def after_sign_out_path_for(resource)
    #case resource
      #when Customer
        #root_path
    #end
  #end






  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end
end
