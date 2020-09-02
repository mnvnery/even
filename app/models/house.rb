class House < ApplicationRecord
  has_many :memberships
  has_many :invitations
  has_many :users, through: :memberships

  validates :name, presence: true
end
