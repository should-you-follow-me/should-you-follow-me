module Metrics
  module Friends
    @@friend_metrics = {
      'justinbieber' => -5,
      'crazyscientist' => 10
    }

    def self.addFriendMetric(user_name, score)
       @@friend_metrics << {user_name => score}
    end

    def self.scores(friends)
      @@friend_metrics.select {|key, val| friends.include? key}
    end
  end
end