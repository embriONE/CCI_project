class PostsController < ApplicationController
  before_action :authenticate_account!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.account_id = current_account.id if account_signed_in?

    if @post.save
      redirect_to dashboard_path, flash: { success: 'Completed' }
    else
      redirect_to new_post_path, flash: { danger: 'Uncomplited!' }

    end
  end

  def like
    @post = Post.all.find(params)
    Like.create(account_id: current_account.id, post_id: @post.id)
    redirect_to post_path(@post)
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :description)
  end
end
