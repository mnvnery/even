class Bill < ApplicationRecord
  belongs_to :house
  has_many :shares
  has_many :users, through: :shares
end
