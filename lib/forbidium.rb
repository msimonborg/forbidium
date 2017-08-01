# frozen_string_literal: true

require "forbidium/version"
require 'forbidium/core_ext/hash'

module Forbidium
  include Forbid
  include Allow
  
  module Forbid
    def forbid(filters = {})
      dup.forbid!(filters)
    end

    def forbid!(filters = {})
      filters.each do |key, val|
        delete_if do |k, v|
          key.to_s == k.to_s && Array(val).include?(v)
        end
      end
      self
    end
  end

  module Allow
    def allow(filters = {})
      dup.allow!(filters)
    end

    def allow!(filters = {})
      filters.each do |key, val|
        delete_if do |k, v|
          key.to_s == k.to_s && !Array(val).include?(v)
        end
      end
      self
    end
  end
end
