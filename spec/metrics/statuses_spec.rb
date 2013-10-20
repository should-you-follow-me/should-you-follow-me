require 'spec_helper'
require 'statuses_aggregator'

describe 'Statuses metrics' do
  it 'Should get no metric score when does not say anything interesting' do
    tweets = [Twitter::Tweet.new(id: 5, text: "This text don't contains it")]

    results = Metrics::StatusesAggregator.run tweets

    expect(results).to be_nil
  end

  context 'Java' do
    it 'Should get bad score when says something about java' do
      tweets = [Twitter::Tweet.new(id: 5, text: "This text contains JaVA!!")]

      results = Metrics::StatusesAggregator.run tweets

      expect(results).to eql({ status_java: -10 })
    end    
  end

  context 'Ruby and Rails, Javascript, Node, all the good stuff' do
    it 'Should get good score of 20 points when says something about Ruby' do
      tweets = [Twitter::Tweet.new(id: 5, text: "Ruby on Rails rox!")]

      results = Metrics::StatusesAggregator.run tweets

      expect(results).to eql({ status_ruby_rails: 20 })
    end

    it 'Should get good score of 20 points when says something about Rails' do
      tweets = [Twitter::Tweet.new(id: 5, text: "Rails Rumble FTW!")]

      results = Metrics::StatusesAggregator.run tweets

      expect(results).to eql({ status_ruby_rails: 20 })
    end

    it 'Should get good score of 20 points when says something about Javascript' do
      tweets = [Twitter::Tweet.new(id: 5, text: "JavasCript FTW!")]

      results = Metrics::StatusesAggregator.run tweets
      expect(results).to eql({ status_javascript: 20 })
    end
  end

end   