class GroupsController < ApplicationController
  def index

  end

  def new
    @group = Group.new
  end

  def create

    @group = current_user.groups.build(group_params)
    @group.user = current_user
    @group_map = @group.group_maps.build(:status => :accepted, :user => current_user)
    # @group_map.user_id = current_user
    # @group_map.group_id = @group
    # @group_map.status = :accepted
    # @group_map.save

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

  private
  def group_params
    params.require(:group).permit(:name, :status);
  end
end
