module Metrics
  module AstrophysicsUserMention
    #19725644: neil tyson
    #17939037: Prof Brian Cox
    USER_IDS = [19725644, 17939037]

    def self.run tweets
      has_mentioned = tweets.any? do |tweet|
        tweet.user_mentions.any? do |user_mention|
          USER_IDS.include? user_mention.id
        end
      end

      { astrophysics: 10 } if has_mentioned
    end
  end
end
