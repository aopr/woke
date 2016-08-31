require 'twitter'
class TwitterUtilities
  class << self
    def client
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["CONSUMER_KEY"]
        config.consumer_secret     = ENV["CONSUMER_SECRET"]
        config.access_token        = ENV["ACCESS_TOKEN"]
        config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
      end
    end

    def search(keyword)
      client.search(keyword)
    end

    def refresh
      client.home_timeline(options = {count: 200, exclude_replies: true})
    end

    def save_story
      refresh.each do |t|
        if (t.retweet_count)
          if (t.retweet_count > 10) # deletes tweets with less than 10 retweets
          Tw.create!(tweeters_id: t.user.id,
                        tweet_url: t.id,
                        favorites: t.favorite_count,
                        retweets_count: t.retweet_count,
                        content: t.text,
                        hashtags: t.hashtags.map(&:text),
                        urls: t.urls.map(&:expanded_url).map(&:to_s),
                        is_retweet: t.retweeted,
                        story_type: nil,
                        tpoic_id: nil,
                        home_side: false)
          end
        end
      end
    end
  end
end
