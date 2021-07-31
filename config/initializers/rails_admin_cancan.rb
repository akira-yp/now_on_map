require 'rails_admin/main_controller'

module RailsAdmin

  class MainController < RailsAdmin::ApplicationController
    rescue_from CanCan::AccessDenied do |exception|
      flash[:alert] = 'アクセス権限がありません'
      redirect_to main_app.events_path
    end
  end
end
