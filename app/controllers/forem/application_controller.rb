module Forem
  class ApplicationController < ::ApplicationController
    private

      def authenticate_forem_user!
        if !current_user
          flash[:notice] = "You must be authenticated before you can do that."
          redirect_to main_app.sign_in_path
        end
      end
  end
end
