module DoingStream
  class Streams::LastFM < Stream::JSONStream
    URI = 'http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=<%= user %>&format=json&limit=5&api_key=<%= api_key %>'

    attr_accessor :api_key

    def initialize user, options = {}
      super
      @api_key = options[:api_key]
    end

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
