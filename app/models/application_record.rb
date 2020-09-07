class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def get_unpaid_share_amount(user)
    shares = Shares.where(user: user, paid: !true)
    total_amount = 0.to_money
    shares.each do |share|
      total_amount += share.amount
    end
    return total_amount
  end


end
