module Metrics
  module InactiveUser
    def self.run(tweets)
      if tweets.first.created_at && tweets.first.created_at < 1.month.ago
        { inactive_user: -10 }
      end
    end
  end
end
