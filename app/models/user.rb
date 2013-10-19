class User
  include Mongoid::Document
  field :name, type: String

  field :metrics, type: Hash
  field :final_score, type: Integer

  field :twitter_id, type: String
  field :twitter_screen_name, type: String
  field :twitter_picture_url, type: String
end
