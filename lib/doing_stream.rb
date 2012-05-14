require 'doing_stream/version'
require 'doing_stream/stream'
require 'doing_stream/streams'

class DoingStream::DoingStream
  attr_accessor :streams

  def initialize streams
    @streams = streams
  end

  def latest
    @latest ||= streams.map do |stream|
      stream.entries.take(2)
    end.flatten.sort_by(&:published).reverse.take(5)
  end

  def entries
    @entries ||= streams.map(&:entries).flatten.sort_by(&:published).reverse
  end
end
