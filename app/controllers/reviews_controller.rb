class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end


  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant_id = params[:restaurant_id]
    @review.save

    # no need for app/views/reviews/create.html.erb
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    
    redirect_to restaurant_path(@review.restaurant)
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end

end
