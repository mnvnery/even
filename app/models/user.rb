class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memberships
  has_many :houses, through: :memberships
  has_many :shares
  has_many :bills, through: :shares
  has_many :payments

  validates :name, :email, presence: true

  def initials
    names = name.split(" ")
    if names.count > 1
      initials = names.first.first + names.last.first
    else
      initials = names.first.first
    end
    initials.upcase
  end

  def first_name
    names = name.split(" ")
    initials = names.first
    initials.capitalize
  end

end
