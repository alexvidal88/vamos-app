module WeatherSearchesHelper
  def retriever(api, key, weather_type, time)
    if weather_type == "weather"

      if key == "tempC" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Temperature: #{api[0]["hourly"][time.to_i][key]} °C"

      elsif key == "uvIndex" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "UV Index: #{api[0]["hourly"][time.to_i][key]} "

      elsif key == "chanceofrain" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Chance of rain: #{api[0]["hourly"][time.to_i][key]}%"

      elsif key == "windspeedKmph" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Wind Speed: #{api[0]["hourly"][time.to_i][key]} Kmph"

      elsif key == "winddir16Point" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Wind Direction: #{api[0]["hourly"][time.to_i][key]}"

      elsif key == "precipMM" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Precipitation: #{api[0]["hourly"][time.to_i][key]} mm"

      elsif key == "humidity" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Humidity: #{api[0]["hourly"][time.to_i][key]} %"

      elsif key == "visibility" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Visibility: #{api[0]["hourly"][time.to_i][key]} Km"
      end

    elsif weather_type == "marine"

      if key == "tempC" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Temperature: #{api[0]["hourly"][time.to_i][key]} °C"

      elsif key == "windspeedKmph" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Wind Speed: #{api[0]["hourly"][time.to_i][key]} Kmph"

      elsif key == "winddir16Point" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Wind Direction: #{api[0]["hourly"][time.to_i][key]}"

      elsif key == "swellHeight_m" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Wave Height: #{api[0]["hourly"][time.to_i][key]} meters"

      elsif key == "swellDir16Point" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Wave Direction: #{api[0]["hourly"][time.to_i][key]}"

      elsif key == "swellPeriod_secs" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Wave Duration: #{api[0]["hourly"][time.to_i][key]} secs"

      elsif key == "waterTemp_C" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "Water Temperature: #{api[0]["hourly"][time.to_i][key]} °C"

      elsif key == "uvIndex" && ("#{time}00").to_i.to_s == api[0]["hourly"][time.to_i]["time"]

        "UV Index: #{api[0]["hourly"][time.to_i][key]}"

      end
    end
  end

  def url_retriever(api, time)
    # if weather_type == "weather"
      api[0]["hourly"][time.to_i]["weatherIconUrl"][0]["value"]
    # else
    #   api[0]["hourly"][time.to_i]["weatherIconUrl"][0]["value"]
    # end
  end

  def weather_comment(api, time)
    # if weather_type == "weather"
      api[0]["hourly"][time.to_i]["weatherDesc"][0]["value"]
    # else
    #   api[0]["hourly"][time.to_i]["weatherDesc"][0]["value"]
    # end
  end

end












