class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  # require "rest-client"

  def home

  end
end
