class WeatherSearchesController < ApplicationController

  def index
    @searches = WeatherSearch.all
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @searches.geocoded.map do |search|
      {
        lat: search.latitude,
        lng: search.longitude
      }
    end
  end

  def new
    @search = WeatherSearch.new
  end

  def create
    @search = WeatherSearch.new(search_params)
    @search.user = current_user
    if @search.save
    redirect_to searches_path
    else
    render :new
    end
  end

  def show
    @search = WeatherSearch.find(params[:id])
  end

  private

  def search_params
    params.require(:weather_search).permit(:start_time, :end_time, :frecuency, :address)
  end
end
