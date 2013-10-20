module Metrics
  module SmallTalk
    SMALL_TALKS = ['good day']

    def self.run(tweets)
      { small_talk: -10 } if small_talked?(tweets)
    end

    private

    def self.small_talked?(tweets)
      tweets.any? { |tweet| contains_small_talk? tweet }
    end

    def self.contains_small_talk?(tweet)
        /#{SMALL_TALKS[0]}/i.match(tweet.full_text)
    end
  end
end
