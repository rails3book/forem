class User < ActiveRecord::Base
  include Forem::UserExtensions
  
  def to_s
    login
  end
end
