class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def community
    @user = User.new
    @searches = WeatherSearch.all
    @output = @searches.map do |search|
      @date = search.start_time.split(" ")[0]
      @url = "https://api.worldweatheronline.com/premium/v1/#{search.weather_type}.ashx?key=bd3331a32f9e48a9bd834355212707&q=#{search.latitude},#{search.longitude}&format=json&tp=1&date=#{@date}"
      @uri = URI(@url)
      @response = Net::HTTP.get(@uri)
      @api = JSON.parse(@response)
      @keys = search.parameters.pluck(:weather_key)
      {:api => @api, :keys => @keys, :weather_type => search.weather_type, :time => search.start_time.split(" ")[1].split(":")[0], id: search.id, :date => search.start_time.split(" ")[0], :exact_time => search.start_time.split(" ")[1]}
    end
  end
end
