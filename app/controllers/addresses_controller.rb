class AddressesController < ApplicationController

  def index
  	@addresses = Address.all
  end

  def new
    @location = Location.find(params[:location_id])
  	@address = Address.new
  end

  def create
    @location = Location.find(params[:address][:location_id])
  	@location.address = Address.new(address_params)
  	if @location.save
  		redirect_to address_path(@location.address)
  	else
  		render :new
  	end
  end

  def edit
  	@address = Address.find(params[:id])
  end

  def update
  	@address = Address.find(params[:id])
  	if @address.update(address_params)
  		redirect_to address_path(@address)
  	else
  		render :edit
  	end
  end

  def show
  	@address = Address.find(params[:id])
  end

  private

  	def address_params
  		params.require(:address).permit(:city, :state, :zip, :street, :country, :location_id)
  		
  	end
end
