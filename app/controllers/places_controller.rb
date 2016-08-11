class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.order("created_at ASC").all.paginate(:page => params[:page], :per_page => 5)
  end
  
  def new
    @place = Place.new
  end
    
  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render text: 'Not Allowed', status: :unauthorized
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: 'Not Allowed', status: :unauthorized
    end

    @place.update_attributes(place_params)
    redirect_to root_path
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description)
  end

end
