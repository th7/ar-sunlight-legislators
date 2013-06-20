require 'twitter'

Twitter.configure do |config|
  config.consumer_key = 'v8FaXU5keTSfonRhN4XQ'
  config.consumer_secret = 'wJMjKEGcpWUsp9o91IZeInjFMvqDRriuAfesYkfw'
  config.oauth_token = '237939201-misloNvdHrX5XZH7IaOBHO7K0Lsm9Wp4RMiww0X7'
  config.oauth_token_secret = 'yEHhRL3e9oHcqFmcNvnD0VGs9rqVDtIoxJCMJE7Y'
end

class CongressMember < ActiveRecord::Base
  has_many :tweets

  def fetch_tweets
    if tweets.length > 0
      new_tweets = Twitter.user_timeline(twitter_id, {:since_id => tweets.last.twitter_id})

      new_tweets.each do |new_tweet|
        self.tweets << Tweet.create(new_tweet)
      end

      self.tweets.shift(new_tweets.length)
    else
      self.tweets = initialize_tweets
    end

    tweets
  end

  def initialize_tweets
    Twitter.user_timeline(twitter_id, {:count => 10}).map do |tweet|
      tweet_attrs = { :twitter_id => tweet[:id],
                      :text => tweet[:text] }
      Tweet.create(tweet_attrs)
    end
  end

  def print_tweets
    tweets.each do |tweet|
      puts tweet.text
    end
    nil
  end
end
