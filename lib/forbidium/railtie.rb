require 'rails/railtie'

module Forbidium
  class Railtie < ::Rails::Railtie
    after_initialize :action_controller do
      ActionController::Parameters.include Forbidium
    end
  end
end
