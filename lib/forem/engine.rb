module Forem
  class Engine < Rails::Engine
    isolate_namespace Forem
    
    config.generators.integration_tool :rspec
    config.generators.test_framework   :rspec
  end
end
