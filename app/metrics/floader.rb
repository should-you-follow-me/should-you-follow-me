module Metrics
  module FloaderMetric
    def self.run tweets
      grouped_tweets = tweets.select{ |tweet| !tweet.created_at.nil? }
        .group_by { |tweet| "#{tweet.created_at.year}-#{tweet.created_at.month}-#{tweet.created_at.day}" }
        .map { |key, val| [key, val.length] }

      is_floader = grouped_tweets.any? { |key, val| val >= 5 }

      { floader: -10 } if is_floader
    end
  end
end