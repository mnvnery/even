class House < ApplicationRecord
  has_many :memberships
  has_many :invitations
  has_many :users, through: :memberships
  has_many :bills

  validates :name, presence: true
end
