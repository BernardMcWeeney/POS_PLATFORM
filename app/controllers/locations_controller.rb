class LocationsController < ApplicationController
    before_action :set_location, only: [:show, :edit, :update, :destroy]

    def switch
      session[:current_location_id] = params[:location_id]
      redirect_to root_path
    end
  
    # GET /locations
    def index
      @locations = Location.all
    end
  
    # GET /locations/1
    def show
    end
  
    # GET /locations/new
    def new
      @location = Location.new
    end
  
    # GET /locations/1/edit
    def edit
    end
  
    # POST /locations
    def create
      @location = Location.new(location_params)
  
      if @location.save
        redirect_to @location, notice: 'location was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /locations/1
    def update
      if @location.update(location_params)
        redirect_to @location, notice: 'location was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /locations/1
    def destroy
      @location.destroy
      redirect_to locations_url, notice: 'location was successfully destroyed.'
    end
  
    private
  
    def set_location
      @location = Location.find(params[:id])
    end
  
    def location_params
      params.require(:location).permit(:name, :group_id, :organisation_id)
    end
  end
  