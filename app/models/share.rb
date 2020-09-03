class Share < ApplicationRecord
  belongs_to :user
  belongs_to :bill

  def self.create_shares_from_bill house, bill
  end
end
