class Payment < ApplicationRecord
  belongs_to :user
  has_many :shares
  monetize :even_amount_cents
end
