class SessionsController < ApplicationController
  def switch_location
    location = current_user.locations.find(params[:location_id])
    session[:current_location_id] = location.id
    redirect_to root_path
  end
end