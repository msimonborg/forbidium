module Forbidium
  # Adds the #allow and #allow! methods
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
