# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'KanjiReader/version'

Gem::Specification.new do |spec|
  spec.name          = "KanjiReader"
  spec.version       = KanjiReader::VERSION
  spec.authors       = ["Yohei Senju"]
  spec.email         = ["yohei.senju@gmail.com"]

  spec.summary       = %q{KanjiReader allows you to read part of word written in Kanji with ruby}
  spec.description   = %q{KanjiReader allows you to read part of word written in Kanji with ruby}
  spec.homepage      = 'https://github.com/100010/KanjiReader'
  spec.license       = "MIT"

  spec.add_dependency "faraday"
  spec.add_dependency "nokogiri"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
