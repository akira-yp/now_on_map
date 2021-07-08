class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @events = current_user.events.includes(:categories).all
    gon.events = @events.map { |event | {
      'event': event,
      'categories': event.categories.pluck(:name),
      'date': "#{event.start_date.strftime("%Y年%m月%d日")} ~ #{event.end_date.strftime("%Y年%m月%d日")}"
      }
    }
  end
end
