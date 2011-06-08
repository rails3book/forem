module Forem
  class Topic < ActiveRecord::Base
    has_many :posts, :order => "created_at ASC"
    has_one :last_post, :class_name => "Forem::Post",
                        :order => "created_at DESC"
    accepts_nested_attributes_for :posts
    
    before_save :set_post_user

    private
      def set_post_user
        self.posts.first.user = self.user
      end
  end
end
