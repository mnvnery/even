class House < ApplicationRecord
  has_many :memberships
  has_many :invitations
  has_many :users, through: :memberships

  validates :house_balance, :name, :email, presence: true
  validates :house_balance, numericality: true
  validates :email, uniqueness: true
end
