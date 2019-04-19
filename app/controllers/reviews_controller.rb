class ReviewsController < ApplicationController
  before_filter :login?

  def create
    @product = Product.find(params[:product_id])
    @review = make_review
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
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

  def login?
    unless current_user
      redirect_to :back
    end
  end
end
