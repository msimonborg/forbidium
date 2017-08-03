# frozen_string_literal: true

module Forbidium
  module ActionController # :nodoc:
    module Parameters # :nodoc:
      # Adds the #forbid and #forbid! methods
      module Forbid # :nodoc:
        include Forbidium::Forbid

        def forbid!(filters = {})
          filters.each do |key, val|
            delete(key) if Array(val).include?(self[key])
          end
          self
        end
      end

      # Adds the #allow and #allow! methods
      module Allow # :nodoc:
        include Forbidium::Allow

        def allow!(filters = {})
          filters.each do |key, val|
            delete(key) unless Array(val).include?(self[key])
          end
          self
        end
      end

      include Allow
      include Forbid
    end
  end
end
