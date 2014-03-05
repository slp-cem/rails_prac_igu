class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(permitted_params)
    @post.save
    render text: "success"
  end
  def edit
    render text: params and return
    @post = Post.where(id: params[:id]).first
  end
  def update
    @post = Post.where(id: params[:id]).first
    @post.update_attributes(permitted_params)
    render text: "sucess"
  end
  def destroy
    @post = Post.where(id: params[:id]).first
    @post.destroy
    render text: "success"
  end

  private

  def permitted_params
    params.require(:post).permit(:title, :main)
  end
end
