require 'rails/railtie'

module Forbidium
  class Railtie < ::Rails::Railtie
    initializer :forbidium do
      ActiveSupport.on_load :action_controller do
        ActionController::Parameters.include Forbidium
      end
    end
  end
end
