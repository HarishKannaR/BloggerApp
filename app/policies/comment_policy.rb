class CommentPolicy < ApplicationPolicy
  def initialize(current_user, comment)
    @current_user = current_user
    @comment = comment
  end

  def user_comment?
    @comment.user.eql?(@current_user)
  end
end
