module WeatherSearchesHelper
  def retriever(api, key, weather_type)
    if weather_type == "ski"
      if key == "humidity"
        api[0]["hourly"][0][key]
      # elsif key == "tempC"
      #   api[0]["hourly"][0]["bottom"][0][key]
      # elsif key == "winddir16Point"
      #    "#{api[0]["hourly"][0]["bottom"][0][key]} #{api[0]["hourly"][0]["bottom"][0]["windspeedKmph"]}"
      end
    elsif weather_type == "marine"
      if key == "uvIndex"
        api[0][key]
      elsif key == "swellHeight_m"
        api[0]["hourly"][0][key]
      elsif key == "waterTemp_C"
         api[0]["hourly"][0][key]
      end
    end
  end
end
