class BlogPostPolicy < ApplicationPolicy
  def initialize(current_user, blog_post)
    @current_user = current_user
    @blog_post = blog_post
  end

  def user_post?
    @blog_post.user.eql?(@current_user)
  end
end
