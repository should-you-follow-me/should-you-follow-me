require 'spec_helper'
require 'metrics_runner'

describe 'Metrics Runner' do
  let(:metrics_runner) { MetricsRunner.new }

  it 'Should get empty result when do not have any metric matching' do
    tweets = [
      Twitter::Tweet.new(id: 1, entities: { user_mentions: [{ id: 1 }, { id: 2 }] })
    ]

    results = metrics_runner.run tweets

    expect(results).to be_empty
  end

  it 'Should return bieber and astrophysics scores' do
    tweets = [
      Twitter::Tweet.new(id: 1, entities: { user_mentions: [{ id: Metrics::BieberUserMention::USER_ID }] }),
      Twitter::Tweet.new(id: 1, entities: { user_mentions: [{ id: Metrics::AstrophysicsUserMention::USER_IDS[0] }] }),
      Twitter::Tweet.new(id: 1, entities: { user_mentions: [{ id: 1 }, { id: 2 }] })
    ]

    results = metrics_runner.run tweets

    expect(results).to eql({ bieber: -10, astrophysics: 10 })
  end
end
