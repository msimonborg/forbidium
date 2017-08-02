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
  module Allow # :nodoc:
    def allow(filters = {})
      dup.allow!(filters)
    end
  end

  module Forbid # :nodoc:
    def forbid(filters = {})
      dup.forbid!(filters)
    end
  end
end
