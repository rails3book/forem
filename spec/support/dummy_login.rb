def sign_out!
  ApplicationController.class_eval <<-STRING
    def current_user
      nil
    end
    
    helper_method :current_user
  STRING
end

def sign_in!(options={})
  ApplicationController.class_eval <<-STRING
    def current_user
      User.find_or_create_by_login("forem_user")
    end
    
    helper_method :current_user
  STRING
end