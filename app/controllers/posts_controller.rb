class PostsController < ApplicationController
  def index
    @posts = Post.listable.order(created_at: :desc)
  end

  def show
    @post = Post.find_by_url_key!(params[:url_key])
  end
end
