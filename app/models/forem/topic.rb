module Forem
  class Topic < ActiveRecord::Base
    has_many :posts, :order => "created_at ASC"
    accepts_nested_attributes_for :posts
  end
end
