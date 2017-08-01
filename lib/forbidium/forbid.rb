# frozen_string_literal: true

module Forbidium
  # Adds the #forbid and #forbid! methods
  module Forbid
    def forbid(filters = {})
      dup.forbid!(filters)
    end

    def forbid!(filters = {})
      filters.each do |key, val|
        delete(key)      if Array(val).include?(self[key])
        delete(key.to_s) if Array(val).include?(self[key.to_s])
      end
      self
    end
  end
end
