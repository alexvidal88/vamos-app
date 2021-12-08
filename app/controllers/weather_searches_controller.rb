  require 'net/http'
  require 'json'

class WeatherSearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :destroy, :show]
  before_action :set_weather_search, only: [:show, :destroy]

  def index
    @review = Review.new
    @searches = current_user.weather_searches
    @markers = @searches.geocoded.map do |search|
      {
        lat: search.latitude,
        lng: search.longitude,
        info_window: render_to_string(partial: "info_window", locals: { search: search})
      }
    end
    @output = @searches.map do |search|
      @date = search.start_time.split(" ")[0]
      @url = "https://api.worldweatheronline.com/premium/v1/#{search.weather_type}.ashx?key=ee9470f53b7d4316b1c62326210812&q=#{search.latitude},#{search.longitude}&format=json&tp=1&date=#{@date}"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @api = JSON.parse(@response)
      @keys = search.parameters.pluck(:weather_key)
      {:api => @api, :keys => @keys, :weather_type => search.weather_type, :time => search.start_time.split(" ")[1].split(":")[0], id: search.id, :date => search.start_time.split(" ")[0], :exact_time => search.start_time.split(" ")[1], :search => search, :address => search.address}
    end
  end

  def new
    @search = WeatherSearch.new
  end

  def create
    @search = WeatherSearch.new(search_params)
    if current_user
      @search.user = current_user
    end
    if @search.save
      params[:weather_search][:parameter_ids].reject(&:blank?).each do |param_name|
        SearchParameter.create(:weather_search => @search, :parameter => Parameter.find_by(weather_parameter: param_name))
      end
      if current_user
        redirect_to weather_searches_path
      else
        redirect_to weather_search_path(@search)
      end
    else
      render :new
    end
  end

  def show
    @search = WeatherSearch.where(user_id: nil).last
    @date = @search.start_time.split(" ")[0]
    @url = "https://api.worldweatheronline.com/premium/v1/#{@search.weather_type}.ashx?key=ee9470f53b7d4316b1c62326210812&q=#{@search.latitude},#{@search.longitude}&format=json&tp=1&date=#{@date}"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @api = JSON.parse(@response)
    @keys = @search.parameters.pluck(:weather_key)
    @output = {:api => @api, :keys => @keys, :weather_type => @search.weather_type, :time => @search.start_time.split(" ")[1].split(":")[0], id: @search.id, :date => @search.start_time.split(" ")[0], :exact_time => @search.start_time.split(" ")[1]}
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
