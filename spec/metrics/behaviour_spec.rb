 describe 'Metrics Behaviour' do
   it 'Should only return one occurrence of the metric score when more than one tweet match the criteria' do
    tweets = [
      Twitter::Tweet.new(id: 1, entities: { 
        user_mentions: [
            { id: 1 }, 
            { id: Metrics::BieberUserMention::USER_ID }
        ]
      }),
      Twitter::Tweet.new(id: 2, entities: { 
        user_mentions: [
            { id: Metrics::BieberUserMention::USER_ID }
        ]
      })
    ]

    results = Metrics::BieberUserMention.run tweets
    expect(results).to eql({ bieber: -10 })
  end
end