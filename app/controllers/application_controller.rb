class ApplicationController < ActionController::Base
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?
    helper_method :current_location
    helper_method :current_cart

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    def after_sign_in_path_for(resource)
        root_path # or whatever path you want
    end

    def current_cart
        if session[:cart_id]
          Cart.find(session[:cart_id])
        else
          cart = Cart.create(user: current_user, location: current_location)
          session[:cart_id] = cart.id
          cart
        end
    end

    def current_location
        @current_location ||= Location.find(session[:current_location_id]) if session[:current_location_id]
    end
end
