  require 'net/http'
  require 'json'

class WeatherSearchesController < ApplicationController
  before_action :set_weather_search, only: [:show, :destroy]
  def index
    @search = WeatherSearch.new
    @searches = WeatherSearch.all

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
    @seach = WeatherSearch.new
  end

  def destroy
    @search.user = current_user
    @search.destroy
    redirect_to weather_searches_path
  end

  private

  def search_params
    params.require(:weather_search).permit(:start_time, :end_time, :frecuency, :address)
  end

  def set_weather_search
    @search = WeatherSearch.find(params[:id])
  end
end
