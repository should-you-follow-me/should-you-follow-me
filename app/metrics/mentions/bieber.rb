module Metrics
  module BieberUserMention
    USER_ID = 123456

    def self.run tweets
      has_mentioned = tweets.each.any? do |tweet| 
        tweet.user_mentions.select { |user_mention| 
          user_mention.id == USER_ID
        }
      end

      { bieber: -10 } if has_mentioned
    end
  end
end