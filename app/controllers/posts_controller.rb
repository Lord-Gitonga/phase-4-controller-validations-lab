class PostsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    post = Post.all
    render json: post
  end

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def render_not_found_response
    render json: {error: 'Not Found'}, status: :not_found
  end

  def render_unprocessable_entity_response(invalid)
    render json: {error: invalid.record.errors }, status: :unprocessable_entity
  end

  def post_params
    params.permit(:category, :content, :title)
  end

end
