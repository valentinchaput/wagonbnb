class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_flat, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    if @booking.save
      redirect_to profile_show_path
    else
      flash.now[:alert] = "Unable to create a booking request"
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:booking][:id])
    if @booking.update(booking_params)
      redirect_to profile_show_path
    else
      redirect_to profile_show_path
    end
  end

  private

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:checkin, :checkout, :status)
  end
end
