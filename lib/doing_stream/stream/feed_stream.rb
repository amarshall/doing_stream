require 'feedzirra'

module DoingStream::Stream
  class FeedStream < Stream
    def feed
      @feed ||= Feedzirra::Feed.fetch_and_parse uri.to_s
    end

    def entries
      @entries ||= feed.entries.map do |entry|
        entry_class.new(name, Hash[entry.to_a])
      end
    end
  end
end
