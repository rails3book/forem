require 'spec_helper'

describe "required configuration options must be set" do
  required_options = [:user_name]
  required_options.each do |option|
    it "requires #{option} is set" do
      Forem::Engine.send("#{option}=", nil)
      option_call = lambda { Forem::Engine.send(option) }
      option_call.should raise_error(Forem::Engine::ConfigurationNotFound,
        "Forem configuration option #{option} not found. " + 
          "Please set this in config/initializers/forem.rb.")

      Forem::Engine.send("#{option}=", "not nil")
      option_call.should_not raise_error
    end
  end
end