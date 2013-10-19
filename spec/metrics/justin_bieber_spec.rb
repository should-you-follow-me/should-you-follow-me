require 'spec_helper'
require 'justin_bieber_metric'

describe 'Follows Justin Biebier' do
  describe '.run_metric' do
    it 'negativates when follow him' do
      friends = ['justinbieber']
      tweets = []
      metric = Metrics::FollowsJustinBieber.run(tweets, friends)

      expect(metric).to eql({ follows_justin_bieber: -5 })
    end

    it 'positivates when not follows' do
      friends = ['SashaGrey']
      tweets = []
      metric = Metrics::FollowsJustinBieber.run(tweets, friends)

      expect(metric).to eql({ follows_justin_bieber: 5 })
    end
  end
end
