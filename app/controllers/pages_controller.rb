class PagesController < ApplicationController
  #before_action :authenticate_user!, :check_onboarding
  before_action :authenticate_user!
  
  def index
    @current_user = current_user
  end

  private

  # def check_onboarding
  #   if current_user.onboarding_incomplete?
  #     redirect_to onboarding_path(Wicked::FIRST_STEP)
  #   end
  # end
end
