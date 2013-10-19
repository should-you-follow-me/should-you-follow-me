class User
  include Mongoid::Document
  field :name, type: String

  field :metrics, type: Hash

  field :twitter_id, type: String
  field :twitter_screen_name, type: String
  field :twitter_picture_url, type: String

  def good_metrics
    metrics.select { |key, value| value > 0 }
  end

  def bad_metrics
    metrics.select { |key, value| value < 0 }
  end

  def should_you_follow_me
    score > 0
  end

  def score
    metrics.values.sum
  end
end
