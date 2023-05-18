class OrganisationsController < ApplicationController
    before_action :set_organisation, only: %i[show edit update destroy]
  
    def index
      @organisations = Organisation.all
    end
  
    def show
      @groups = @organisation.groups

    end
  
    def new
      @organisation = Organisation.new
    end
  
    def create
      @organisation = Organisation.new(organisation_params)
  
      if @organisation.save
        redirect_to @organisation, notice: 'Organisation was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @organisation.update(organisation_params)
        redirect_to @organisation, notice: 'Organisation was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
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
  