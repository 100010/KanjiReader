# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'KanjiConvertor/version'

Gem::Specification.new do |spec|
  spec.name          = "KanjiConvertor"
  spec.version       = KanjiConvertor::VERSION
  spec.authors       = ["Yohei Senju"]
  spec.email         = ["yohei.senju@gmail.com"]

  spec.summary       = 'Allows you to read kanji with ruby'
  spec.description   = ''
  spec.homepage      = 'http://mukaer.com/archives/2012/03/18/rubyurl_uri/'
  spec.license       = "MIT"

  spec.add_dependency "faraday"
  spec.add_dependency "nokogiri"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
