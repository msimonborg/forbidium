# frozen_string_literal: true

require 'forbidium/allow'
require 'forbidium/forbid'

module Forbidium
  def self.included(base)
    [Forbidium::Allow, Forbidium::Forbid].each { |mod| base.include mod }
  end
end
