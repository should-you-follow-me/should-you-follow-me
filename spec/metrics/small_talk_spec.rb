require 'spec_helper'
require 'small_talk'

describe 'User small talk metrics' do
  context 'When tweets about any of these subjects' do
    it 'Should result a score of -10 when tweets contains "Good day"' do
      tweets = [Twitter::Tweet.new(id: 5, text: "Good Day")]
      results = Metrics::SmallTalk.run tweets

      expect(results).to eql({ small_talk: -10  })
    end
  end
end
