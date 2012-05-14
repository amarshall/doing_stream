module DoingStream
  class Streams::Pinboard < Stream::FeedStream
    URI = 'http://feeds.pinboard.in/rss/u:<%= user %>/'
  end
end
