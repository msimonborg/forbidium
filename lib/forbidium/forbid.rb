module Forbidium
  # Adds the #forbid and #forbid! methods
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
end
