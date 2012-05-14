module DoingStream
  class Streams::LastFM < Stream::JSONStream
    URI = 'http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=<%= user %>&format=json&limit=5&api_key=b25b959554ed76058ac220b7b2e0a026'

    def json
      super['recenttracks']['track']
    end

    class Entry < Stream::Entry
      def published
        if data['@attr'] && data['@attr']['nowplaying'] == 'true'
          Time.now
        else
          Time.at data['date']['uts'].to_i
        end
      end
    end
  end
end
