class AddPaymentToShares < ActiveRecord::Migration[6.0]
  def change
    add_reference :shares, :payment, foreign_key: true
  end
end
