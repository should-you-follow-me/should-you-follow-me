module Metrics
  module SmallTalker
    SMALL_TALKS = [
      'good day',
      'good morning',
      'good evening',
      'good night',
      'good friday',
      'going to sleep'
    ]

    def self.run(tweets)
      { small_talk: -10 } if has_small_talked?(tweets)
    end

    private

    def self.has_small_talked?(tweets)
      tweets.any? do |tweet|
        SMALL_TALKS.any? { |small_talk| is_small_talk? tweet, small_talk }
      end
    end

    def self.is_small_talk?(tweet, small_talk)
        /^#{small_talk}$/i.match(tweet.full_text)
    end
  end
end
