# frozen_string_literal: true

require 'rails/railtie'

module Forbidium
  # Railtie initializer that adds Forbidium methods to controller params
  class Railtie < ::Rails::Railtie
    initializer :forbidium do
      ActiveSupport.on_load :action_controller do
        ::ActionController::Parameters.send :include, Forbidium::ActionController::Parameters
      end
    end
  end
end
