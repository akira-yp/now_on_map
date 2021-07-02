module EventsHelper
  def render_with_hashtags(description)
    description.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){ |tag| link_to tag, "/events/hashtag/#{tag.delete('/[#＃]/')}"}.html_safe
  end
end
