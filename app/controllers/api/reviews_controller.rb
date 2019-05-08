class Api::ReviewsController < ApplicationController

    def create
        @review = Review.new(review_params)

        if @review.save
            render :show
        else
            render json: @review.errors.full_messages, status: 420
        end
    end

    def update
        @review = Review.find_by(user_id: params[:review][:user_id], business_id: params[:review][:business_id])

        if @review.update(review_params)
            render :show
        else
            render json: @review.errors.full_messages, status: 420
        end
    end

    def destroy
        @review = Review.find(params[:id])
        if @review.destroy
            render :show
        else
            render json: @review.errors.full_messages, status: 420
        end
    end

    private
    def review_params
        params.require(:review).permit(:rating, :body, :business_id, :user_id)
    end
end