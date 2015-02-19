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
      redirect_to flat_booking_path(@flat, @booking)
    else
      flash.now[:alert] = "Unable to create a booking request"
      render :new
    end
  end

  # def edit
  # end

  # def update
  # end

  private

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:checkin, :checkout)
  end
end
