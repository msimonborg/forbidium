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
            if key.is_a? Symbol
              delete(key.to_s) if Array(val).include?(self[key.to_s])
            end
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
            if key.is_a? Symbol
              delete(key.to_s) unless Array(val).include?(self[key.to_s])
            end
          end
          self
        end
      end

      include Allow
      include Forbid
    end
  end
end
