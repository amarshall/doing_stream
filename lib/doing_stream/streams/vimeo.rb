module DoingStream
  class Streams::Vimeo < Stream::Stream
    def initialize user
      @likes = Likes.new user
      @videos = Videos.new user
    end

    def entries
      @entries ||= begin
                     (@likes.entries + @videos.entries).sort_by(&:published).reverse.each do |entry|
                       class << entry; alias_method :type, :name; end
                       entry.define_singleton_method(:name) { "vimeo" }
                       def entry.to_h; super.tap { |h| h['data']['type'] = type }; end
                     end
                   end
    end
  end

  class Streams::Vimeo::Likes < Stream::JSONStream
    URI = 'http://vimeo.com/api/v2/<%= user %>/likes.json'

    class Entry < Stream::Entry
      def published
        Time.parse data['liked_on']
      end
    end
  end

  class Streams::Vimeo::Videos < Stream::JSONStream
    URI = 'http://vimeo.com/api/v2/<%= user %>/videos.json'

    class Entry < Stream::Entry
      def published
        Time.parse data['upload_date']
      end
    end
  end
end
