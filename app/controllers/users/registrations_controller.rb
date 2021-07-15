class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only:[:update]

  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end

  private
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys:[:name,:image,:image_cache])
  end
end
