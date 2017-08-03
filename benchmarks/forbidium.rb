# frozen_string_literal: true

require 'benchmark'
require 'bundler/setup'
require 'forbidium'
require 'action_pack'
require 'active_support'
require 'action_controller'

ActionController::Parameters.class_eval do
  include Forbidium::ActionController::Parameters
end

hash = {}

1_000_000.times do |n|
  hash[n.to_s] = n
end

params = ActionController::Parameters.new({})
params_filter = {}

1_000_000.times do |n|
  params[n] = n
  params_filter[n] = n
end

Benchmark.bmbm do |bm|
  bm.report('Hash#allow') { hash.allow(hash) }
  bm.report('Hash#forbid') { hash.forbid(hash) }

  bm.report('ActionController::Parameters#allow') do
    params.allow(params_filter)
  end

  bm.report('ActionController::Parameters#forbid') do
    params.forbid(params_filter)
  end
end
