require 'spec_helper'
require 'justin_bieber_metric'

describe 'Follows Justin Biebier' do
  describe '.run_metric' do
    it 'negativates when follow him' do
      account = DataStructures::Account.new([], ['justinbieber'])
      metric = Metrics::FollowsJustinBieber.run(account)

      expect(metric).to eql({ follows_justin_bieber: -5 })
    end

    it 'positivates when not follows' do
      account = DataStructures::Account.new([], ['SashaGrey'], '')
      metric = Metrics::FollowsJustinBieber.run(account)

      expect(metric).to eql({ follows_justin_bieber: 5 })
    end
  end
end
