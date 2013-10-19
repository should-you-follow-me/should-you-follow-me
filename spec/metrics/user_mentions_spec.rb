require 'spec_helper'
require 'mentions/bieber'

describe 'When mention someone which decreases your score' do
  it 'Justin Bieber should result a score of -10' do
    tweets = [
      Twitter::Tweet.new(id: 1, 
        entities: { 
          user_mentions: [
            { id: 1 }, { id: Metrics::BieberUserMention::USER_ID }
          ]
        })
    ]

    results = Metrics::BieberUserMention.run tweets

    expect(results).to eql({ 'bieber_user_mention' => -10 })
  end
end