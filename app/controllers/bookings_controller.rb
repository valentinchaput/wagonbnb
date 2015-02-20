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

  # def create
  #   @booking = Booking.new(booking_params)
  #   @booking.flat = @flat
  #   @booking.user = current_user
  #   if @flat.right_dates?(@booking)
  #     if @flat.available?(@booking)
  #       if @booking.save
  #         redirect_to flat_booking_path(@flat, @booking)
  #       else
  #         flash.now[:alert] = "Unable to create a booking request"
  #         render :new
  #       end
  #     else
  #       flash.now[:alert] = "Unavailable - please try other dates"
  #       render :new
  #     end
  #   else
  #     flash.now[:alert] = "Dates are not valid - either are before today or checkout is before checkin"
  #     render :new
  #   end
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    if @flat.available?(@booking)
      if @booking.save
        redirect_to flat_booking_path(@flat, @booking)
      else
        flash.now[:alert] = "Unable to create a booking request"
        render :new
      end
    else
      flash.now[:alert] = "Unavailable - please try other dates"
      render :new
    end
  end


  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:booking][:id])
    if @booking.update(booking_params)
      redirect_to flats_path
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
