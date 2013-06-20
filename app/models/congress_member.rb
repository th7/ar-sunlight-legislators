require 'twitter'

Twitter.configure do |config|
  config.consumer_key = 'v8FaXU5keTSfonRhN4XQ'
  config.consumer_secret = 'wJMjKEGcpWUsp9o91IZeInjFMvqDRriuAfesYkfw'
  config.oauth_token = '237939201-misloNvdHrX5XZH7IaOBHO7K0Lsm9Wp4RMiww0X7'
  config.oauth_token_secret = 'yEHhRL3e9oHcqFmcNvnD0VGs9rqVDtIoxJCMJE7Y'
end

class CongressMember < ActiveRecord::Base
  def tweets
    if !@tweets.nil? && @tweets.length > 0
      new_tweets = Twitter.user_timeline(twitter_id, {:since_id => @tweets.last.id}) 
      @tweets += new_tweets
      @tweets.shift(new_tweets.length)
    else
      @tweets = initialize_tweets
    end
    @tweets
  end

  def initialize_tweets
    Twitter.user_timeline(twitter_id, {:count => 10})
  end

  def print_tweets
    tweets.each do |tweet|
      puts tweet.text
    end
    nil
  end
end
