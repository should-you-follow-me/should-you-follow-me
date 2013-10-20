require 'spec_helper'
require 'flooder'

describe 'Floader Metric' do
   it 'Should get score of -10 when tweets more than five times per day' do
    tweets = [
      Twitter::Tweet.new(id: 1, created_at: 'Mon Jul 16 12:59:01 +0000 2007'),
      Twitter::Tweet.new(id: 1, created_at: 'Mon Jul 16 11:59:01 +0000 2007'),
      Twitter::Tweet.new(id: 1, created_at: 'Mon Jul 16 10:59:01 +0000 2007'),
      Twitter::Tweet.new(id: 1, created_at: 'Mon Jul 16 09:59:01 +0000 2007'),
      Twitter::Tweet.new(id: 1, created_at: 'Mon Jul 16 08:59:01 +0000 2007')
    ]
    results = Metrics::FlooderMetric.run tweets

    expect(results).to eql({ flooder: -10 })
  end

  it 'Should not get flooder metric score when tweets regularly' do
    tweets = [
      Twitter::Tweet.new(id: 1, created_at: 'Mon Jul 16 12:59:01 +0000 2007'),
      Twitter::Tweet.new(id: 1, created_at: 'Mon Jul 16 11:59:01 +0000 2007'),
      Twitter::Tweet.new(id: 1, created_at: 'Mon Jul 16 08:59:01 +0000 2007'),
      Twitter::Tweet.new(id: 1, created_at: 'Sun Jul 15 10:59:01 +0000 2007'),
      Twitter::Tweet.new(id: 1, created_at: 'Sun Jul 15 09:59:01 +0000 2007')
    ]
    results = Metrics::FlooderMetric.run tweets

    expect(results).to be_nil
  end
end
