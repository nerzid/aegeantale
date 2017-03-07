class User < ApplicationRecord

  has_many :posts
  has_many :group_maps
  has_many :groups, :through => :group_maps


  has_attached_file :avatar, styles: { medium: "250x250#", thumb: "40x40#" }, :default_url => "/avatars/medium/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  rolify

  # enum role: [:student, :teacher, :seller]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable
  validates :terms_of_service, :allow_nil => false, :acceptance => true, :on => :create

  attr_accessor :role
  validates :role, presence: true, :on => :create
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
