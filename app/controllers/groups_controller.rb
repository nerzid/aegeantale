class GroupsController < ApplicationController
  def index
    # @groups = Group.joins(:group_maps).merge(GroupMap.where(:status => :accepted))
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create

    @group = current_user.groups.build(group_params)
    @group.user = current_user
    @group_map = @group.group_maps.build(:status => :accepted, :user => current_user)

    if @group.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update

  end

  def destroy

  end

  def request_join
    @group = Group.find(params[:id])
    @group_map = @group.group_maps.build(:status => :waiting, :user => current_user)

    # status kontrolü yapılacak

    if @group_map.save
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  def accept_join_request
    @group = Group.find(params[:id])
    @user = User.find(params[:user_id])

    if @group.group_maps.where(:user_id => @user).update(:status => :accepted)
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :status);
  end
end
