module  Api
  class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :update, :destroy]
    def index
      @reviews = Review.all

      render json: @reviews
    end

    def show
      render json: @review
    end

    def create
      @review = Review.new(review_params)
      # if @user.save
      #   payload = {user_id: @user.id}
      #   token = encode_token(payload)
      #   render json: {user: @user, token: token}, status: :created, location: api_user_url(@user)
      # else
      #   render json: { errors: @user.errors}, status: :unprocessable_entity
      # end
    end

    # # PATCH/PUT /users/1
    # def update
    #   if @user.update(user_params)
    #     render json: @user
    #   else
    #     render json: @user.errors, status: :unprocessable_entity
    #   end
    # end

    # # DELETE /users/1
    # def destroy
    #   @user.destroy
    # end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_review
        @review = Review.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def review_params
        params.require(:review).permit(:reason, :duration, :advice,:food,:convenient,:favorite,:score)
      end
  end
end
