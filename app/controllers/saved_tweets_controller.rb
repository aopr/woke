class SavedTweetsController < ApplicationController
def new
  @saved_tweet = SavedTweet.new
end

def create
  @saved_tweet = SavedTweet.create!(saved_tweet_params)
end

def index
  @saved_tweets = SavedTweet.all
end

def update

end

private
def saved_tweets_params
  params.require.(:saved_tweets).permit(:tweeters_id, :tweet_url, :favorites, :retweets_count, :content, :hashtags, :urls, :is_retweet, :story_type. :topic_id, :home_side)

end

end
