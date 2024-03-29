class PostsController < ApplicationController

  def index
    #@posts = Post.all
  end

  def show
    #@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    # @user = User.find(params[:user_id])
    @post = current_user.posts.create(post_params)

    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

end
