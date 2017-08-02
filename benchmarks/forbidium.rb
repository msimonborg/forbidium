# frozen_string_literal: true

require 'benchmark'
require 'bundler/setup'
require 'forbidium'

hash = {}

1_000_000.times do |n|
  hash[n.to_s] = n
end

Benchmark.bmbm do |bm|
  bm.report('Hash#allow') { hash.allow(hash) }
  bm.report('Hash#forbid') { hash.forbid(hash) }
end
