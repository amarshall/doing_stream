module DoingStream
  class Streams::Twitter < Stream::JSONStream
    URI = 'http://api.twitter.com/1/statuses/user_timeline.json?screen_name=<%= user %>'
  end
end
