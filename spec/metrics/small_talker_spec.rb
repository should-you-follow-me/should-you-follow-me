require 'spec_helper'
require 'small_talker'

describe 'User small talker metrics' do
  context 'When tweets about any small talker' do
    describe 'Should result a score of -10 when tweets contains:' do
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
  end
end
