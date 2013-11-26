require 'rubygems'
require 'bundler/setup'
require 'twitter'
require 'foreman'

module UserComparer
  class User
  	attr_reader :username
  	def initialize(username)
  		@username = username
  	end

  	def client
  		@client = Twitter::REST::Client.new do |config|
  		  config.consumer_key       = ENV['CONSUMER_KEY']
  		  config.consumer_secret    = ENV['CONSUMER_SECRET']
  		  config.access_token        = ENV['OAUTH_TOKEN']
  		  config.access_token_secret = ENV['OAUTH_TOKEN_SECRET']
  		end

  		@client
  	end

  	def followers
  		client.user(@username).followers_count
  	end

  	def friends
  		client.user(@username).friends_count
  	end

  	def tweets
  		client.user(@username).tweets_count
  	end
  end

  class Comparer
  	attr_reader :user1, :user2
  	def initialize(user1, user2)
  		@user1 = user1
  		@user2 = user2
  	end

  	def compare_followers
  		if user1.followers > user2.followers
  			return user1.username
  		elsif user2.followers > user1.followers
  			return user2.username
  		else
  			return "tie"
  		end
  	end

  	def compare_friends
  		if user1.friends > user2.friends
  			return user1.username
  		elsif user2.friends > user1.friends
  			return user2.username
  		else
  			return "tie"
  		end
  	end

  	def compare_tweets
  		if user1.tweets > user2.tweets
  			return user1.username
  		elsif user2.tweets > user1.tweets
  			return user2.username
  		else
  			return "tie"
  		end
  	end
  end
end