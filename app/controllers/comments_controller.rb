class CommentsController < ApplicationController
  before_action :set_user, only: [:create, :new, :destroy]
  before_action :set_post, only: [:create, :new, :destroy]

  def new
    # @user = User.find(params[:user_id])
    # @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    # @user = User.find(params[:user_id])
    # @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = @user
    if @comment.save
      flash[:success] = "Comment has been added to #{@post.user.user_name}'s post"
      redirect_to user_path(@user)
    else
      Rails.logger.debug("Comment errors: #{@comment.errors.full_messages.join(", ")}")
      flash[:error] = "There was an error creating the comment: #{@comment.errors.full_messages.join(", ")}"
      render :new
    end
  end

  # def create
  #   @comment = @post.comments.build(comment_params)
  #   @comment.user = @user # Associate the comment with the user
  #   if @comment.save
  #     flash[:success] = "Comment has been added to #{@post.user.user_name}'s post"
  #     redirect_to user_post_path(@post.user, @post)
  #   else
  #     Rails.logger.debug("Comment errors: #{@comment.errors.full_messages.join(", ")}")
  #     flash[:error] = "There was an error creating the comment: #{@comment.errors.full_messages.join(", ")}"
  #     render :new
  #   end
  # end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = "Comment for #{@user.user_name} post has been deleted"
      redirect_to user_path(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
