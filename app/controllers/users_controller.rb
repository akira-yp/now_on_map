class UsersController < ApplicationController
  before_action :authenticate_user!
  def mypage
    @events = current_user.favorite_events.includes(:categories).all
    gon.events = @events.map { |event | {
      'event': event,
      'categories': event.categories.pluck(:name),
      'date': "#{event.start_date.strftime("%Y年%m月%d日")} ~ #{event.end_date.strftime("%Y年%m月%d日")}",
      'current_user':current_user.id
      }
    }
    gon.user_id = current_user.id
  end

  def posts_index
    @events = current_user.events.includes(:categories).all.order(created_at:"DESC")
    gon.events = @events.map { |event | {
      'event': event,
      'categories': event.categories.pluck(:name),
      'date': "#{event.start_date.strftime("%Y年%m月%d日")} ~ #{event.end_date.strftime("%Y年%m月%d日")}",
      'current_user': current_user.id
      }
    }
    gon.user_id = current_user.id
    render 'mypage'
  end
end
