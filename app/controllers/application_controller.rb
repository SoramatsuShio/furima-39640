class ApplicationController < ActionController::Base
 

  private

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email, :password, :family_name_zenkaku, :first_name_zenkaku, :family_name_kana, :first_name_kana, :date_of_birth])
end


end
