  require 'net/http'
  require 'json'

class WeatherSearchesController < ApplicationController
  before_action :set_weather_search, only: [:show, :destroy]
  def index
    # @search = WeatherSearch.new
    @searches = current_user.weather_searches
    @markers = @searches.geocoded.map do |search|
      {
        lat: search.latitude,
        lng: search.longitude
      }
    end

     @output = @searches.map do |search|
      @url = "https://api.worldweatheronline.com/premium/v1/#{search.weather_type}.ashx?key=c554d8234d824db29ee34354211407&q=#{search.latitude},#{search.longitude}&format=json"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @api = JSON.parse(@response)
      @keys = search.parameters.pluck(:weather_key)
      {:api => @api, :keys => @keys, :weather_type => search.weather_type}
    end
  end

  def new
    @search = WeatherSearch.new
  end

  def create
    @search = WeatherSearch.new(search_params)
    @search.user = current_user
    if @search.save
      params[:weather_search][:search_parameter_ids].reject(&:blank?).each do |id|
        SearchParameter.create(:weather_search => @search, :parameter_id => id)
      end
      redirect_to weather_searches_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @search.destroy
    redirect_to weather_searches_path
  end


  private

  def search_params
    params.require(:weather_search).permit(:address, :weather_type, :start_time, :end_time, :frecuency)
  end

  def set_weather_search
    @search = WeatherSearch.find(params[:id])
  end
end
