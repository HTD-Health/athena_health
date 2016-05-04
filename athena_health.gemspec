# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'athena_health/version'

Gem::Specification.new do |spec|
  spec.name          = 'athena_health'
  spec.version       = AthenaHealth::VERSION
  spec.authors       = ["Mateusz Urbański"]
  spec.email         = ['mateuszurbanski@yahoo.pl']

  spec.summary       = 'Ruby wrapper for Athenahealth API.'
  spec.description   = 'Ruby wrapper for Athenahealth API. See https://developer.athenahealth.com/io-docs for more details.'
  spec.homepage      = 'https://github.com/zywy/athena_health'
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'typhoeus'
  spec.add_dependency 'virtus'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'vcr', '~> 3.0'
end
