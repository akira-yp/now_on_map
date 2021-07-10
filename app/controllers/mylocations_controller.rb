class MylocationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @mylocation = Mylocation.new(latlng_params)
    respond_to do |format|
      format.js
    end
  end

  def create
    @mylocation = current_user.mylocations.build(mylocation_params)
    respond_to do |format|
      if @mylocation.save
        format.html { redirect_to mypage_user_path(current_user.id) }
        format.js { render js: "window.location = '#{mypage_user_path(current_user.id)}' " }
      else
        format.js
      end
    end
  end

  def destroy
  end

  private

  def mylocation_params
    params.require(:mylocation).permit(:name, :my_address, :my_latitude, :my_longitude)
  end

  def latlng_params
    params.permit(:my_latitude,:my_longitude,:user_id)
  end
end
