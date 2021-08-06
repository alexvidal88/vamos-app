# data = File.read('public/user_seeds.json')
# new_users = JSON.parse(data)
# new_users['users'].each do |new_user|
#   created_user = User.new(
#     first_name: new_user['first_name'],
#     last_name: new_user['last_name'],
#     username: new_user['username'],
#     email: new_user['email'],
#     password: '12345678'
#   )
#   created_user.save!
# end

## land parameters
Parameter.create(weather_parameter: "UV Index", activity_type: "weather", weather_key: "uvIndex")
Parameter.create(weather_parameter: "Chance of rain", activity_type: "weather", weather_key: "chanceofrain")
Parameter.create(weather_parameter: "Wind speed",activity_type: "weather", weather_key: "windspeedKmph")
Parameter.create(weather_parameter: "Wind direction", activity_type: "weather", weather_key: "winddir16Point")
Parameter.create(weather_parameter: "Precipitation", activity_type: "weather", weather_key: "precipMM")
Parameter.create(weather_parameter: "Humidity",activity_type: "weather", weather_key: "humidity")
Parameter.create(weather_parameter: "Visibility", activity_type: "weather", weather_key: "visibility")

## water parameters
Parameter.create(weather_parameter: "Temperature", activity_type: "marine", weather_key: "tempC")
Parameter.create(weather_parameter: "Wind speed",activity_type: "marine", weather_key: "windspeedKmph")
Parameter.create(weather_parameter: "Wind direction", activity_type: "marine", weather_key: "winddir16Point")
Parameter.create(weather_parameter: "Wave height", activity_type: "marine", weather_key: "swellHeight_m")
Parameter.create(weather_parameter: "Wave direction",activity_type: "marine", weather_key: "swellDir16Point")
Parameter.create(weather_parameter: "Wave duration", activity_type: "marine", weather_key: "swellPeriod_secs")
Parameter.create(weather_parameter: "Water Temperature", activity_type: "marine", weather_key: "waterTemp_C")
Parameter.create(weather_parameter: "UV Index",activity_type: "marine", weather_key: "uvIndex")
