class User
  include Mongoid::Document
  field :name, type: String

  field :metrics, type: Hash
  field :final_score, type: Integer

  field :twitter_id, type: String
  field :twitter_screen_name, type: String
  field :twitter_picture_url, type: String

  def good_metrics
    metrics.select { |key, value| value > 0 }
  end

  def bad_metrics
    metrics.select { |key, value| value < 0 }
  end
end
