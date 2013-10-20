require 'spec_helper'
require 'small_talker'

describe 'User small talker metrics' do
  context 'When tweets about any small talker' do
    describe 'Should result a score of -10 when tweets a small talk:' do
      it 'Good day' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good Day")]
        results = Metrics::SmallTalker.run tweets

        expect(results).to eql({ small_talk: -10  })
      end

      it 'Good morging' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good Morning")]
        results = Metrics::SmallTalker.run tweets

        expect(results).to eql({ small_talk: -10  })
      end

      it 'Good evening' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good Evening")]
        results = Metrics::SmallTalker.run tweets

        expect(results).to eql({ small_talk: -10  })
      end

      it 'Good night' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good Night")]
        results = Metrics::SmallTalker.run tweets

        expect(results).to eql({ small_talk: -10  })
      end

      it 'Happy friday' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good Friday")]
        results = Metrics::SmallTalker.run tweets

        expect(results).to eql({ small_talk: -10  })
      end
    end
    describe 'Should not result any score when not tweets a small talk:' do
      it 'Good day everybody, today is amazing day outside' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good day everybody, today is amazing day outside")]
        results = Metrics::SmallTalker.run tweets

        expect(results).to be_nil
      end
    end
  end
end
