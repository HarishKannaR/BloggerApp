class CommentsController < ApplicationController
  before_action :get_post
  before_action :authenticate_user!

  def create
    @comment = @blog_post.comments.create(comment_params)
    redirect_to blog_post_path(@blog_post)
  end

  def destroy
    @blog_post.comments.find(params[:id]).destroy
    redirect_to blog_post_path(@blog_post)
  end

  private

  def comment_params
    params[:comment].permit(:message, :user_id)
  end

  def get_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end
end
