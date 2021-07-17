  require 'net/http'
  require 'json'

class WeatherSearchesController < ApplicationController

  def index
    @url = 'https://api.github.com/users/ssaunier'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    @search = WeatherSearch.new
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

  end

  def create
    @search = WeatherSearch.new(search_params)
    @search.user = current_user
    if @search.save
      redirect_to weather_searches_path
    else
      render :index
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
