module Forem
  class Engine < Rails::Engine
    isolate_namespace Forem
    
    config.generators.integration_tool :rspec
    config.generators.test_framework   :rspec
    
    cattr_accessor :user_name
    
    def self.user_name
      @@user_name || raise(ConfigurationNotFound.new("user_name"))
    end
    
    class ConfigurationNotFound < StandardError
      attr_accessor :message
      def initialize(option)
        @message = "Forem configuration option #{option} not found. " + 
          "Please set this in config/initializers/forem.rb."
      end
    end
  end
end

require 'forem/user_extension'