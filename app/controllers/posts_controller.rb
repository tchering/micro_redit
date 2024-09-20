class PostsController < ApplicationController
  before_action :set_user, only: [:create, :destroy]

  def index
    @posts = Post.all
    # @user = User.find_by(id: params[:user_id])
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.valid?
      @post.save
      flash[:success] = "New post has been created"
      redirect_to user_path(@user)
    end
  end

  def destroy
    @post = @user.posts.find(params[:id])
    if @post.destroy
      flash[:success] = "The post has been deleted"
      redirect_to user_path(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
