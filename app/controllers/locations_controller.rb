class LocationsController < ApplicationController

  def index
  	@trip = Trip.find(params[:trip_id])
  	@locations = @trip.locations
  	# @location = @trip.locations.find(params[:id])
  	# @location = Trip.find(params[:id]).locations
  end

  def show
  	@trip = Trip.find(params[:trip_id])
  	@location = @trip.locations.find(params[:id])
  end

  def edit
  	  @trip = Trip.find(params[:trip_id])
  	  @location = @trip.locations.find(params[:id])
  end

  def update
  	@trip = Trip.find(params[:trip_id])
  	@location = @trip.locations.find(params[:id])

  	if @location.update(trip_id: @trip.id)
  		redirect_to trip_location_path(@trip, @location)
  	else
        render :edit
    end
  end

  def new
  	@trip = Trip.find(params[:trip_id])
  	@location = Location.new
  	# binding.pry
  	# @location.where(trip_id: @trip)
  end

  def create 
  	@trip = Trip.find(params[:trip_id])
  	@location = @trip.locations.new(location_params)

  	if @location.save
  		redirect_to trip_location_path(@trip, @location)
  	else
  		render :show
  	end
  end 

  def destroy
  	# @trip = Trip.find(params[:trip_id])
  	# @location = trip.locations.find(params[:id])
  	@location = Location.find(params[:id])
  	@location.destroy

  	redirect_to trip_locations_path

  end

  private 

  def location_params
  	params.require(:location).permit(:name, :description, :trip_id)
  end

end
