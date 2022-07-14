class LikesController < ApplicationController

  def save_like
    @like = Like.new(post_id: params[:post_id], account_id: current_account.id)
    @post.account_id = current_account.id if account_signed_in?
    respond_to do |format|
      format.json {
        if @like.save
          { success: true }
        else
          { success: false }
        end
      }
    end
  end
end

