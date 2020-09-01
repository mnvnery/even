class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :house

  validates :house, uniqueness: { scope: :user }
end
