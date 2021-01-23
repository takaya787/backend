module  Api
  #module Apiを使用する場合は対象のcontrollerをapi フォルダーに収納する必要がある
  class ReviewsController < ApplicationController
    #application_controller
    before_action :authorized, except: [:index,:check]
    before_action :set_review, only: [:show, :update, :destroy]
    def index
      @reviews = Review.includes(:spot)

      render 'reviews/index.json.jbuilder'
    end

    def show
      render json: @review
    end

    def create
      @review = @current_user.reviews.new(review_params)
      if @review.save
        result = Geocoder.search([ params[:lat], params[:lng] ]).first.address
        # has_manyとhas_oneでコードが変わる(former: has_many, latter: has_one)
        # spot = @review.spot.create(:address => result )
        spot = @review.create_spot(:address => result )
        render json: {review: @review, message:'reviewが作成されました。'}, status: :created, location: api_review_url(@review)
      else
        render json: { errors: @review.errors}, status: :unprocessable_entity
      end
    end

    def check
      result = Geocoder.search(params[:keyword])
      unless result.empty?
        center = result.first.coordinates
        render json: {lat: center[0],lng: center[1],message: '検索結果を表示します。' }, status: :ok
      else
        render json: { error: '該当する場所が見つかりませんでした。' }, status: :bad_request
      end
    end

    # # PATCH/PUT /users/1
    def update
      if @review.update(review_params)
        render json: @review
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end

    # # DELETE /users/1
    def destroy
      @review.destroy
      render json: {message: 'Review is deleted successfully'},status: :okay
    end

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
