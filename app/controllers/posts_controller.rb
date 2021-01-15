module Api
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
    # skip_before_action :verify_authenticity_token,
    # GET /posts
    def index
      @posts = Post.all
      render json: { status: 'SUCCESS', message: 'Loaded the post', data: @posts }
    end

    # GET /posts/1
    def show
      render json: { status: 'SUCCESS', message: 'Loaded the post', data: @post }
    end

    # POST /posts
    def create
      @post = Post.new(post_params)

      if @post.save
        render json: @post, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
      render json: { message: 'the post is deleleted',data: @post }
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title)
      end
  end
end
