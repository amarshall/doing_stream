module DoingStream
  class Streams::GitHub < Stream::JSONStream
    URI = 'https://api.github.com/users/<%= user %>/events/public'

    def entries
      @entries ||= super.select { |entry| %w[ForkEvent PublicEvent PushEvent].include? entry.data['type'] }
    end

    class Entry < Stream::Entry
      def published
        Time.parse data['created_at']
      end
    end
  end
end
