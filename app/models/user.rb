class User < ApplicationRecord

  has_many :posts
  has_many :groups, :through => :group_maps

  rolify

  # enum role: [:student, :teacher, :seller]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  validates :terms_of_service, :allow_nil => false, :acceptance => true

  attr_accessor :role
  validates :role, presence: true
  after_create :assign_role

  def assign_role
    if self.role == "student"
      self.add_role(:student)
    elsif self.role == "teacher"
      self.add_role(:teacher)
    else
      self.add_role(:seller)
    end
  end


end
