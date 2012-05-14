require 'erb'
require 'uri'

module DoingStream::Stream
  class Stream
    attr_accessor :entries, :uri

    def initialize user
      @uri = ::URI.parse(ERB.new(self.class::URI).result(binding))
    end

    def entry_class
      if self.class.constants.include? :Entry
        self.class.const_get(:Entry)
      else
        Entry
      end
    end

    def name
      self.class.to_s.split('::').last.downcase
    end
  end
end
