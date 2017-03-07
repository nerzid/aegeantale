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
    @groups = Group.all
  end

  def timeline

  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    @user.avatar = params[:user][:avatar]

    if @user.save!
      redirect_to user_path
    else
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:avatar)
  end
end
