module DoingStream
  class Streams::Vimeo < Stream::Stream
    def initialize user
      @likes = Likes.new user
      @videos = Videos.new user
    end

    def entries
      @entries ||= (@likes.entries + @videos.entries).sort_by(&:published).reverse
    end
  end

  class Streams::Vimeo::Likes < Stream::JSONStream
    URI = 'http://vimeo.com/api/v2/<%= user %>/likes.json'

    def name; 'vimeo'; end

    class Entry < Stream::Entry
      def published
        Time.new data['liked_on']
      end
    end
  end

  class Streams::Vimeo::Videos < Stream::JSONStream
    URI = 'http://vimeo.com/api/v2/<%= user %>/videos.json'

    def name; 'vimeo'; end

    class Entry < Stream::Entry
      def published
        Time.new data['upload_date']
      end
    end
  end
end
