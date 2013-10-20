module Metrics
  module InactiveUser
    def self.run(tweets)
      { inactive_user: -10 } if tweets.any? { |tweet| tweet.created_at < 1.month.ago }
    end
  end
end
