module WeatherSearchesHelper
  def retriever(api, key, weather_type, time)
    if weather_type == "weather"
      if key == "uvIndex" && ("#{time}00").to_i.to_s == api[0]["hourly"][0]["time"]
        "#{api[0]["hourly"][0][key]} UV Index"
        # "#{api[0][key]}" #(@api["data"]["weather"][0]["avgtempC"])

      elsif key == "chanceofrain" && ("#{time}00").to_i.to_s == api[0]["hourly"][0]["time"]
        # "#{api[0][key]} Hours of sun"
        "#{api[0]["hourly"][0][key]} % Chance of rain"
      # elsif key == "winddir16Point"
      #    "#{api[0]["hourly"][0]["bottom"][0][key]} #{api[0]["hourly"][0]["bottom"][0]["windspeedKmph"]}"
      end
    elsif weather_type == "marine"
    #   if key == "uvIndex"
    #     api[0]["hourly"][0][key]
    #   elsif key == "swellHeight_m"
    #     api[0]["hourly"][0][key]
    #   elsif key == "waterTemp_C"
    #      api[0]["hourly"][0][key]
    #   end
    # end
    end
  end
end


# <%  @output.each do |out|  %>
#   <div class="card">
#     <% out[:keys].each do |key| %>
#       <h1> <%=  retriever(out[:api]["data"]["weather"], key, out[:weather_type]), out[:time] %> </h1>
#     <% end %>
#   </div>
# <% end %>
