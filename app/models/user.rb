class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships
  has_many :houses, through: :memberships
  has_many :shares
  has_many :bills, through: :shares

  validates :name, :email, presence: true

  def initials

    # current_user.name.split(" ")[0][0]  current_user.name.split(" ")[1][0]
    # name.split(" ").map {|n| n[0]}
  end
end
