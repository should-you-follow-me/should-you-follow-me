require 'spec_helper'

describe 'Follows Justin Biebier' do
  describe '.run_metric' do
    it 'negativates when follow him' do
      friends = ['justinbieber']
      tweets = []
      metric = Metrics::FollowsJustinBieber.run(tweets, friends)

      expect(metric).to eql({ follows_justin_bieber: -5 })
    end

    it '' do

    end
  end
end
