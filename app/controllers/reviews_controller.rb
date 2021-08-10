class ReviewsController < ApplicationController
  def create
    @search = WeatherSearch.find(params[:weather_search_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.weather_search = @search
    session[:review_error] = nil
    if @review.save
      redirect_to "#{request.referrer}#review-#{@review.id}"
    else
      session[:review_error] = "Comment at least three characters"
      redirect_to request.referrer
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :photo)
  end
end
