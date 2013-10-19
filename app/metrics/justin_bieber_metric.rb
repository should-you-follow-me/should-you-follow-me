module Metrics
  module FollowsJustinBieber
    def self.run(tweets, friends)
      if friends.include?('justinbieber')
        { follows_justin_bieber: -5 }
      else
        { follows_justin_bieber: 5 }
      end
    end
  end
end
