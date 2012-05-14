require 'curb'
require 'json'

module DoingStream::Stream
  class JSONStream < Stream
    def body
      @body ||= Curl::Easy.perform(uri.to_s).body_str
    end

    def json
      JSON.parse body
    end

    def entries
      @entries ||= json.map do |entry|
        entry_class.new(name, entry)
      end
    end
  end
end
