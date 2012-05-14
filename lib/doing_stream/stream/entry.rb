require 'date'
require 'json'

module DoingStream::Stream
  class Entry < Struct.new(:name, :data)
    def published
      published = data['published']
      published = Time.new published unless published.is_a? Time
      published
    end

    def to_h
      { 'feed_name' => name, name => 'true', 'published' => published, 'data' => data }
    end

    def to_json
      to_h.to_json
    end
  end
end
