module DoingStream
  class Streams::Twitter < Stream::JSONStream
    URI = 'http://api.twitter.com/1/statuses/user_timeline.json?screen_name=<%= user %>'

    class Entry < Stream::Entry
      def published
        Time.parse data['created_at']
      end
    end
  end
end
