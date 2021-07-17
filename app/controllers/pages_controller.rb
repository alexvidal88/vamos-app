class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  # require "rest-client"

  def home
    require 'net/http'
    require 'json'
    @url = 'https://api.github.com/users/ssaunier'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
  end
end
