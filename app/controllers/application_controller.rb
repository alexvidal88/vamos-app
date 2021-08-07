class ApplicationController < ActionController::Base
  before_action :clear_old_searches
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def clear_old_searches
    WeatherSearch.where("start_time < ?", Date.today).destroy_all
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :photo])
  end
end

