module Metrics
  module NodekoUserMention
    USER_ID = 654321

    def self.run tweets
      has_mentioned = tweets.each.any? do |tweet| 
        tweet.user_mentions.any? do |user_mention| 
          user_mention.id == USER_ID
        end
      end 

      { nodeko: 10 } if has_mentioned
    end
  end
end