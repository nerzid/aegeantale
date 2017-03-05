class GroupMap < ApplicationRecord
  belongs_to :group
  belongs_to :user


  # We would need to define a method to access enum attributes
  # they can be accessed just by typing :accepted as well but it seems bad
  # If we change the statuses in enum
  enum status: [:waiting, :accepted, :rejected]

  def get_status(user,group)
    GroupMap.find(params[user,group]).status
  end

end
