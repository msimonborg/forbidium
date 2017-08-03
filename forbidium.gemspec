# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'forbidium/version'

Gem::Specification.new do |spec|
  spec.name          = 'forbidium'
  spec.version       = Forbidium::VERSION
  spec.authors       = ['M. Simon Borg']
  spec.email         = ['msimonborg@gmail.com']

  spec.summary       = 'Filter hash keys based on allowed and forbidden values. Renamed "Allowable".'
  spec.description   = 'Filter hash keys based on allowed and forbidden values. Renamed "Allowable".'
  spec.homepage      = 'https://github.com/msimonborg/forbidium'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z lib LICENSE.txt README.md CHANGELOG.md`.split("\0")

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'allowable'

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.post_install_message = "`Forbidium` has been renamed to `Allowable`. Please remove `forbidium` from your Gemfile and replace it with `allowable`. `forbidium` just installs the latest version of `allowable` anyway, so it will still work. But you won't be able to lock the version. Do the right thing and switch to `allowable`"
end
