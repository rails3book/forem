RSpec.configure do |c|
  c.before(:each) do
    Forem::Engine.user_name = :login
  end
end