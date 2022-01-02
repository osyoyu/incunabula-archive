class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by_url_key(params[:url_key])
    raise ActiveRecord::RecordNotFound if @post.nil?
  end
end
