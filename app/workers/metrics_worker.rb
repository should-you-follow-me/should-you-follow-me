require 'twitter'

class MetricsWorker
  include Sidekiq::Worker

  def perform(twitter_screen_name)
    client = Twitter::Client.new(:consumer_key => 'uypAfO6IstkFRGfFm8Ux8A', :consumer_secret => 'xL0z5GPQGEs2613Eongw4iHVKDx14EjB9Zrg614vo')

    twitter_user = client.user twitter_screen_name

    tweets = client.user_timeline(twitter_screen_name, count: 200)
    metrics = MetricsRunner.new.run(tweets)

    User.create name: twitter_user.name,
                twitter_picture_url: twitter_user.profile_image_url(:bigger),
                twitter_screen_name: twitter_screen_name,
                metrics: metrics
  end
end
