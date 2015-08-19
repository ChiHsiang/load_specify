# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'load_specify/version'

Gem::Specification.new do |spec|
  spec.name          = "load_specify"
  spec.version       = LoadSpecify::VERSION
  spec.authors       = ["ChiHsiang"]
  spec.email         = ["1207victory@gmail.com"]
  spec.homepage      = "https://github.com/ChiHsiang/load_specify"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
