module Forem
  class Engine < ::Rails::Engine
    isolate_namespace Forem
    
    config.generators.integration_tool :rspec
    config.generators.test_framework   :rspec
    
    class << self
      attr_accessor :user_class
    end
    
    def self.user_class
      error = "Please define Forem::Engine.user_class" +
              " in config/initializers/forem.rb"
      @user_class || raise(Forem::ConfigurationNotSet, error)
    end
  end
end
