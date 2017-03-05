class Group < ApplicationRecord

  belongs_to :user

  has_many :group_maps, :dependent => :destroy
  has_many :users, :through => :group_maps


  def is_owner?(user)
    self.user == user
  end

  def is_member?(user)
    self.group_maps.where(:user_id => user).pluck(:status) == :accepted
  end

  def get_users(user)
    if is_owner?(user)
      User.find(self.group_maps.pluck(:user_id)) # this return group ids
    else
      "nope"
    end
  end

  def get_member_status(user)
    self.group_maps.where(:user_id => user).pluck(:status).first
  end

end
