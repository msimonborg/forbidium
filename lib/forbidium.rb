# frozen_string_literal: true

require 'allowable'
require 'forbidium/version'

# frozen_string_literal: true

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
  include Allowable
end
