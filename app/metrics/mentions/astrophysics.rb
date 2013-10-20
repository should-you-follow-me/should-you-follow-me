module Mentions
  module AstrophysicsUserMention
    USER_IDS = [222, 333, 444]

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
