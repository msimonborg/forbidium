# frozen_string_literal: true

require 'benchmark'
require 'bundler/setup'
require 'forbidium'
require 'action_controller'

ActionController::Parameters.class_eval do
  include Forbidium
end

hash = {}

1_000_000.times do |n|
  hash[n] = n
end

params = ActionController::Parameters.new(hash)

Benchmark.bmbm do |bm|
  bm.report('Hash#allow') { hash.allow(hash) }
  bm.report('Hash#forbid') { hash.forbid(hash) }

  bm.report('ActionController::Parameters#allow') do
    params.allow(hash)
  end

  bm.report('ActionController::Parameters#forbid') do
    params.forbid(hash)
  end
end
