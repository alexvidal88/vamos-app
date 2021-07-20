class WeatherSearchesController < ApplicationController

  def index
    # @searches = WeatherSearch.all
    @url = 'https://api.github.com/users/ssaunier'
    @user_serialized = URI.open(@url).read
    @user = JSON.parse(@user_serialized)
    # puts "#{@user['name']} - #{@user['bio']}"
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
    params.require(:weather_search).permit(:start_time, :end_time, :frecuency)
  end
end
