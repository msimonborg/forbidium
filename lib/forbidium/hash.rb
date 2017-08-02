# frozen_string_literal: true

module Forbidium
  module Hash
    # Adds the #forbid and #forbid! methods
    module Forbid
      include Forbidium::Forbid

      def forbid!(filters = {})
        filters.each do |key, val|
          delete(key) if Array(val).include?(self[key])
        end
        self
      end
    end

    # Adds the #allow and #allow! methods
    module Allow
      include Forbidium::Allow

      def allow!(filters = {})
        filters.each do |key, val|
          delete(key) unless Array(val).include?(self[key])
        end
        self
      end
    end

    include Forbid
    include Allow
  end
end
