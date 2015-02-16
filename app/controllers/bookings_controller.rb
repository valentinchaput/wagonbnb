class BookingsController < ApplicationController
  before_action :find_user, only: [:new, :create]

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
    @booking.user = @user
    @booking.flat = Flat.find(dose_params[:flat_id].to_i)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      # render :signup ou :signin ?
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:flat_id, :checkin, :checkout)
  end
end