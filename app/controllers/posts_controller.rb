class PostsController < ApplicationController
  def index
    @posts = Post.listable.order(created_at: :desc)
  end

  def show
    @post = Post.find_by_url_key!(params[:url_key])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      title: params[:post][:title],
      body: params[:post][:body],
      is_draft: params[:post][:is_draft],
    )
    @post.save! # TODO: Error handling
    redirect_to @post
  end
end
