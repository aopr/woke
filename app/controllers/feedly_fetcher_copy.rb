class FeedlyFetcher
  attr_reader :options

  def self.fetch(options={})
    new(options).create_stories
  end

  def initialize(options={})
    @options = options
  end

  def client
    @client ||= Feedlr::Client.new(oauth_access_token:ENV['FEEDLY_KEY'])
  end

  def feeds
    @feeds ||= client.user_subscriptions
  end

  HTTP_ERRORS = [
  HTTParty::UnsupportedURIScheme,
  URI::InvalidURIError,
  Errno::ECONNREFUSED
  ]

  def save_stories(streams)
    stories = client.stream_entries_contents(streams, count: options[:count] || 5).to_h
    begin
      stories["items"].each do |story|
        SavedFeedly.create!(
        source_id: streams,
        source: story.origin.title,
        # pub_date: story.published,  #try Time.at(story.published)
        headline: story.title,
        url: story.originId,
        pic: nil,
        keywords: story.keywords,
        lead: nil,
        topic_id: nil,
        story_type: "Feedly",
        home_feature: false,
        home_main: false,
        home_main_pic: false,
        home_right: false,
        topic_feature: false,
        topic_pic: false,
        )
      end
    rescue
    end
  end

  def scrape_pics
    SavedFeedly.all.each do |story|
      if SavedFeedly.pic_url.nil?
        link = story.url
        begin
          body = HTTParty.get(link).response.body
        rescue *HTTP_ERRORS => error
        end

        dom = Nokogiri::HTML(body)

        if dom.css("meta[property='og:image']").present?
          story.pic_url = dom.css("meta[property='og:image']").attribute('content').value
          story.pic_url
          story.save
        elsif dom.css("meta[id='ogimage']").present?
          story.pic_url = dom.css("meta[id='ogimage']").attribute('content').value
          story.pic_url
          story.save
        end
      end
    end
  end

  def create_stories
    feeds.each do |feed_info|
      save_stories(feed_info.to_h['id'])
      scrape_pics
    end
  end
end
