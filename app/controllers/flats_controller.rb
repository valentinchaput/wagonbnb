class FlatsController < ApplicationController

  def index
    @flats = Flat.all
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
    if params[:search]
      @flats = Flat.search(params[:search]).order("created_at DESC")
    else
      @flats = Flat.all.order('created_at DESC')
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @flat_coordinates = { latitude: @flat.latitude, longitude: @flat.longitude }
    @booking = Booking.new
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user_id = current_user.id
    if @flat.save
      flash[:notice] = "Flat was successfully created."
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    if @flat.update(flat_params)
      flash[:notice] = "Flat was successfully updated."
      redirect_to flat_path(@flat)
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :address, :city, :price, :user_id, :availability, :picture)
  end
end

