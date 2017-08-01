# frozen_string_literal: true

require 'forbidium/allow'
require 'forbidium/forbid'

# Filter hashes by setting  allowed or forbidden values for specific keys.
#
#     hash = { one: 'one', two: 'two' }
#
#     hash.forbid(one: 'one') # => { two: 'two' }
#
#     hash.allow(one: 'two') # => { two: 'two' }
#
#     hash.allow(one: ['one', 'two']) # => { one: 'one', two: 'two' }
#
#     hash.forbid(one: ['one', 'two']) # => { two: 'two' }
#
#     hash.allow!(one: 'two') # => { two: 'two' }
#
#     hash.forbid!(two: 'two') # => {}
#
#     hash # => {}
module Forbidium
  def self.included(base)
    [Forbidium::Allow, Forbidium::Forbid].each { |mod| base.include mod }
  end
end
