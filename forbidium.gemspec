# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'forbidium/version'

Gem::Specification.new do |spec|
  spec.name          = "forbidium"
  spec.version       = Forbidium::VERSION
  spec.authors       = ["M. Simon Borg"]
  spec.email         = ["msimonborg@gmail.com"]

  spec.summary       = %q{Filter hash keys based on allowed and forbidden values.}
  spec.description   = %q{Filter hash keys based on allowed and forbidden values.}
  spec.homepage      = "https://github.com/msimonborg/forbidium"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z lib LICENSE.txt README.md`.split("\0")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end