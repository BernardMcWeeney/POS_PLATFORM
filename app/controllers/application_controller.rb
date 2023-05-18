class ApplicationController < ActionController::Base
    include Pundit

    def after_sign_in_path_for(resource)
        root_path # or whatever path you want
      end
end
