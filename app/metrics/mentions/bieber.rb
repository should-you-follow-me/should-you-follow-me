module Metrics
  module BieberUserMention
    USER_ID = 27260086

    def self.run tweets
      has_mentioned = tweets.any? do |tweet| 
        tweet.user_mentions.any? do |user_mention| 
          user_mention.id == USER_ID
        end
      end 

      { bieber: -10 } if has_mentioned
    end
  end
end