include Pundit

class OrganisationsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_organisation, only: %i[show edit update destroy]
  
    def index
      @organisations = Organisation.all
    end
  
    def show
    end
  
    def new
      @organisation = Organisation.new
    end
  
    def create
      @organisation = Organisation.new(organisation_params)
      authorize @organisation
  
      if @organisation.save
        redirect_to @organisation, notice: 'Organisation was successfully created.'
      else
        render :new
      end
    end
  
    def edit
        authorize @organisation
    end
  
    def update
      authorize @organisation
      if @organisation.update(organisation_params)
        redirect_to @organisation, notice: 'Organisation was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      authorize @organisation
      @organisation.destroy
      redirect_to organisations_url, notice: 'Organisation was successfully destroyed.'
    end
  
    private
  
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end
  
    def organisation_params
        params.require(:organisation).permit(:name, :address, :owner, :web_links, :image)
    end  
  end
  