class Share < ApplicationRecord
  belongs_to :user
  belongs_to :bill

  monetize :amount_cents

  def self.create_shares_from_bill house, bill
  end
end
