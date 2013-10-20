module Metrics
  module SmallTalk
    SMALL_TALKS = [
      'good day',
      'good morning',
      'good evening',
      'good night',
      'good friday'
    ]

    def self.run(tweets)
      { small_talk: -10 } if small_talked?(tweets)
    end

    private

    def self.small_talked?(tweets)
      tweets.any? do |tweet|
        SMALL_TALKS.any? { |small_talk| contains_small_talk? tweet, small_talk }
      end
    end

    def self.contains_small_talk?(tweet, small_talk)
        /#{small_talk}/i.match(tweet.full_text)
    end
  end
end
