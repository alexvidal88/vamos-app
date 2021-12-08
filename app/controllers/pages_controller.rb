class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def community
    @review = Review.new
    @searches = WeatherSearch.where.not(user_id: nil)
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
end
