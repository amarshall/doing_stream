# -*- encoding: utf-8 -*-
require File.expand_path('../lib/doing_stream/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Marshall"]
  gem.email         = ["andrew@johnandrewmarshall.com"]
  gem.description   = %q{Accumulate streams from various sites}
  gem.summary       = %q{Accumulate streams from various sites}
  gem.homepage      = "http://johnandrewmarshall.com/projects/doing-stream"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "doing_stream"
  gem.require_paths = ["lib"]
  gem.version       = DoingStream::VERSION

  gem.add_dependency 'curb'
  gem.add_dependency 'feedzirra'
  gem.add_dependency 'json'
end
