class FlatsController < ApplicationController
  before_action :set_flat

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
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

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :description, :city, :price, :user_id, :availability, :picture)
  end
end

