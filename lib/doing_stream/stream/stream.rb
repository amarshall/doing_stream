require 'erb'
require 'uri'

module DoingStream::Stream
  class Stream
    attr_accessor :entries, :user

    def initialize user, options = {}
      @user = user
      @options = options
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

    def uri
      ::URI.parse(ERB.new(self.class::URI).result(binding))
    end
  end
end
