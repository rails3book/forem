class User < ActiveRecord::Base
  include Forem::UserExtensions
end
