class FlatsController < ApplicationController

  def index
    @flats = Flat.all
    if params[:search]
    @flats = Flat.search(params[:search]).order("created_at DESC")
  else
    @flats = Flat.all.order('created_at DESC')
  end
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

  def flat_params
    params.require(:flat).permit(:title, :description, :city, :price, :user_id, :availability, :picture)
  end
end

