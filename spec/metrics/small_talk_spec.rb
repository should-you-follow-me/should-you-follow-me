require 'spec_helper'
require 'small_talk'

describe 'User small talk metrics' do
  context 'When tweets about any small talk' do
    describe 'Should result a score of -10 when tweets contains:' do
      it 'Good day' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good Day")]
        results = Metrics::SmallTalk.run tweets

        expect(results).to eql({ small_talk: -10  })
      end

      it 'Good morging' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good Morning")]
        results = Metrics::SmallTalk.run tweets

        expect(results).to eql({ small_talk: -10  })
      end

      it 'Good evening' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good Evening")]
        results = Metrics::SmallTalk.run tweets

        expect(results).to eql({ small_talk: -10  })
      end

      it 'Good night' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good Night")]
        results = Metrics::SmallTalk.run tweets

        expect(results).to eql({ small_talk: -10  })
      end

      it 'Happy friday' do
        tweets = [Twitter::Tweet.new(id: 5, text: "Good Friday")]
        results = Metrics::SmallTalk.run tweets

        expect(results).to eql({ small_talk: -10  })
      end
    end
  end
end
