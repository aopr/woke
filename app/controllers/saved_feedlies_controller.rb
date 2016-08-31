class SavedFeedliesController < ApplicationController
  def new
    @saved_feedly = Saved_feedly.new
  end

  def create
    @saved_feedly = Saved_feedly.create!(saved_feedly_params)
  end

  def index
    @saved_feedlies = Saved_feedly.all
  end

private
  def saved_feedly_params
    params.require(:saved_feedly).permit(:source, :headline, :url, :pic, :keywords, :lead, :topic_id, :story_type, :show_pic, :home_feature, :home_main, :home_main_pic, :home_right, :topic_feature, :topic_pic)
  end
end

end
