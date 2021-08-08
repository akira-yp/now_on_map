module EventsHelper
  def render_with_hashtags(description)
    description.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){ |tag| link_to tag, "/events/hashtag/#{tag.delete('/[#＃]/')}", class:"hashtag"}.html_safe
  end

  def choose_new_or_edit
    if action_name == 'new'
      events_path
    elsif action_name == 'edit'
      event_path
    end
  end
end
