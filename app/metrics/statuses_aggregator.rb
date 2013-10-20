module Metrics
  module StatusesAggregator
    def self.run(tweets)
      @scores = {}
      StatusesMetrics.submodules.each do |sub_module|
        if tweets_contain_words(tweets, sub_module::WORDS)
          @scores.merge!(sub_module.score)
        end
      end

      @scores if @scores.size > 0
    end

    def self.tweets_contain_words(tweets, words)
      #["jAVA", "Jsf", "hibernate", "c#", ".net"].any? { |item| /#{item}/i.match("Yesterday I worked with Java and C#")}
      tweets.any? { |tweet| words.any? { |item| /\b#{item}\b/i.match(tweet.full_text)} }
    end
  end
end

class Module
  def submodules
    constants.collect {|const_name| const_get(const_name)}.select {|const| const.class == Module}
  end
end