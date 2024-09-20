class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  before_action :set_comment, only: [:show]

  def index
    @users = User.all
  end

  def show
    # @post = @user.posts.build
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:success] = "User have been created"
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User has been destroyed"
      redirect_to users_path
    else
      flash[:error] = "User cannot be deleted"
    end
  end

  private

  def set_comment
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name)
  end
end
