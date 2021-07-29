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

      @date = search.start_time.split(" ")[0]
      @url = "https://api.worldweatheronline.com/premium/v1/#{search.weather_type}.ashx?key=bd3331a32f9e48a9bd834355212707&q=#{search.latitude},#{search.longitude}&format=json&tp=1&date=#{@date}"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @api = JSON.parse(@response)
      @keys = search.parameters.pluck(:weather_key)
      {:api => @api, :keys => @keys, :weather_type => search.weather_type, :time => search.start_time.split(" ")[1]}
    end
  end

  def new
    @search = WeatherSearch.new
  end

  def create
    @search = WeatherSearch.new(search_params)
    @search.user = current_user
    if @search.save
      params[:weather_search][:parameter_ids].reject(&:blank?).each do |param_name|
        SearchParameter.create(:weather_search => @search, :parameter => Parameter.find_by(weather_parameter: param_name))
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
