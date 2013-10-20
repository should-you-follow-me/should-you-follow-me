require 'spec_helper'
require 'inactive_user'

describe 'Inactive User' do
  it 'scores -10 if its last tweet was a month ago' do
    date = 'Mon Jul 16 08:59:01 +0000 2007'
    Delorean.time_travel_to(date)

    tweets = [Twitter::Tweet.new(id: 1, created_at: 2.month.ago.in_time_zone.to_s)]
    metrics = Metrics::InactiveUser.run tweets

    expect(metrics).to eql({ inactive_user: -10 })

    Delorean.back_to_the_present
  end

  it 'not scores if its last tweet was less than a month ago' do
    date = 'Mon Jul 16 08:59:01 +0000 2007'
    Delorean.time_travel_to(date)

    tweets = [Twitter::Tweet.new(id: 1, created_at: 3.days.ago.in_time_zone.to_s)]
    metrics = Metrics::InactiveUser.run tweets

    expect(metrics).to be_nil

    Delorean.back_to_the_present
  end
end
