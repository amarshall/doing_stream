# DoingStream

Accumulate streams from various sites, with the intention of manipulating them
into a single stream of your activities on the internet—i.e., a stream of
things you are *doing*.

## Installation

With Bundler, simply add this line to your application's Gemfile:

    gem 'doing_stream'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install doing_stream

## Usage

There are six built-in streams:

- GitHub
- Last.FM
- Pinboard
- StackOverflow
- Vimeo
- Twitter

Simply create each stream desired with the username, then pass a collection of
them to `DoingStream::DoingStream.new`:

    streams = []
    streams << DoingStream::Streams::GitHub.new('foobar')
    streams << DoingStream::Streams::LastFM.new('foobar', api_key: 'my_awesome_api_key')
    streams << DoingStream::Streams::Pinboard.new('foobar')
    streams << DoingStream::Streams::StackOverflow.new(42)
    streams << DoingStream::Streams::Vimeo.new('foobar')
    entries = DoingStream::DoingStream.new(streams)
    entries.latest

Keep in mind that most of the API-based streams have rate-limits, so it would
be wise to cache the results if you expect this to run frequently.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

Copyright © 2012 J. Andrew Marshall. All rights reserved.
