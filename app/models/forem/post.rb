module Forem
  class Post < ActiveRecord::Base
    belongs_to :topic, :counter_cache => true
  end
end
