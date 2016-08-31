class CreateSavedTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :saved_tweets do |t|
      t.integer :tweeters_id
      t.text :tweet_url
      t.integer :favorties
      t.integer :retweets_count
      t.text :content
      t.string :hashtags
      t.string :urls
      t.boolean :is_retweet
      t.string :story_type
      t.integer :topic_id
      t.boolean :home_side

      t.timestamps
    end
  end
end
