class User < ApplicationRecord
  has_one :user_detail
  has_many :ads

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :user]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def name
    user_detail.name
  end

  def self.admin
    User.find_by(role: :admin)
  end
end
