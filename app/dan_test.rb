tweets = [
  Twitter::Tweet.new(id: 1, created_at: "Mon Jul 16 12:59:01 +0000 2007"),
  Twitter::Tweet.new(id: 1, created_at: "Mon Jul 16 11:59:01 +0000 2007"),
  Twitter::Tweet.new(id: 1, created_at: "Mon Jul 16 08:59:01 +0000 2007"),
  Twitter::Tweet.new(id: 1, created_at: "Sun Jul 15 10:59:01 +0000 2007"),
  Twitter::Tweet.new(id: 1, created_at: "Sun Jul 15 09:59:01 +0000 2007")      
]

tweets.each {|tweet| puts tweet.created_at.year}