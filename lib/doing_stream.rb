require 'doing_stream/version'
require 'doing_stream/stream'
require 'doing_stream/streams'

class DoingStream::DoingStream
  attr_accessor :streams

  def initialize streams
    @streams = streams
  end

  def latest n = 5, m = 2
    streams.map do |stream|
      stream.entries.take((m.respond_to? :call) ? m.call(stream) : m)
    end.flatten.sort_by(&:published).reverse.take(n)
  end

  def entries
    @entries ||= streams.map(&:entries).flatten.sort_by(&:published).reverse
  end
end
