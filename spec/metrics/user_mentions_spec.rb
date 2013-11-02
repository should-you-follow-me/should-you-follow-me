require 'spec_helper'

describe 'User mentions metrics' do
  context 'When mention someone which decreases your score' do
    it 'Should result a score of -10 when mentioned Justin Bieber' do
      tweets = [
        Twitter::Tweet.new(id: 1, entities: {
          user_mentions: [
              { id: 1 },
              { id: Metrics::BieberUserMention::USER_ID }
          ]
        })
      ]

      results = Metrics::BieberUserMention.run tweets
      expect(results).to eql({ bieber: -10 })
    end

    it 'Should not return bieber metric score when not mentioned Justin Bieber' do
      tweets = [Twitter::Tweet.new(id: 1, entities: { user_mentions: [{ id: 1 }] })]

      results = Metrics::BieberUserMention.run tweets
      expect(results).to be_nil
    end

  end

  context 'When mention someone which increases your score' do
    it 'Should result a score of +10 when mention Node Knockout' do
      tweets = [
        Twitter::Tweet.new(id: 1, entities: {
          user_mentions: [
              { id: 1 },
              { id: Metrics::NodekoUserMention::USER_ID }
          ]
        })
      ]

      results = Metrics::NodekoUserMention.run tweets
      expect(results).to eql({ nodeko: 10 })
    end

    it 'Should not return nodeko metric when not mentioned Node Knockout' do
      tweets = [Twitter::Tweet.new(id: 1, entities: { user_mentions: [{ id: 1 }] })]

      results = Metrics::NodekoUserMention.run tweets
      expect(results).to be_nil
    end

    it 'Should result a score of 10 when any astrophysic of the list has been mentioned' do
      tweets = [
        Twitter::Tweet.new(id: 1, entities: {
          user_mentions: [
              { id: 1 },
              { id: Metrics::AstrophysicsUserMention::USER_IDS[0] }
          ]
        })
      ]

      results = Metrics::AstrophysicsUserMention.run tweets
      expect(results).to eql({ astrophysics: 10 })
    end

    it 'Should not return astrophysics metric when not mentioned any of the list' do
      tweets = [Twitter::Tweet.new(id: 1, entities: { user_mentions: [{ id: 1 }] })]

      results = Metrics::AstrophysicsUserMention.run tweets
      expect(results).to be_nil
    end
  end
end
