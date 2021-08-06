class ReviewsController < ApplicationController
  def create
    @search = WeatherSearch.find(params[:weather_search_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.weather_search = @search
    if @review.save
      redirect_to weather_searches_path
    else
      render request.referrer
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
