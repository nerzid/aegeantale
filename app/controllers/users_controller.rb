class UsersController < ApplicationController


  def is_student?
    current_user.has_role?(:student)
  end
  helper_method :is_student?

  def is_teacher?
    current_user.has_role?(:teacher)
  end
  helper_method :is_teacher?

  def is_seller?
    current_user.has_role?(:seller)
  end
  helper_method :is_seller?

  def index
    @post = Post.new
    @group = Group.new
  end

  def timeline

  end

end
