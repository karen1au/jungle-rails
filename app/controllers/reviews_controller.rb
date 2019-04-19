class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @review = make_review
    redirect_to product_path(@product)
    # if @review.save
    #   redirect_to :back
    # else
    #   redirect_to '/'
    # end
  end

  private
  def make_review
    review = @product.reviews.create(
      product_id: @product.id,
      user_id: current_user.id,
      rating: params[:review][:rating],
      description: params[:review][:description]
    )
    review
  end

  # def review_params 
  #   params.require(:review).permit(
  #     :rating,
  #     :description
  #   )
  # end


end
