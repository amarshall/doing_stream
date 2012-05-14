require 'open-uri'
require 'zlib'

module DoingStream
  class Streams::StackOverflow < Stream::JSONStream
    URI = 'https://api.stackexchange.com/2.0/users/<%= user %>/timeline?site=stackoverflow&pagesize=100'

    def body
      @body ||= Zlib::GzipReader.new(open(uri.to_s)).read
    end

    def json
      super['items']
    end

    def entries
      @entries ||= super.select { |entry| %w[answered asked badge].include? entry.data['timeline_type'] }
    end

    class Entry < Stream::Entry
      def published
        Time.at data['creation_date'].to_i
      end
    end
  end
end
