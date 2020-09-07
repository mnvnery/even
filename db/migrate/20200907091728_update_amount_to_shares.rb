class UpdateAmountToShares < ActiveRecord::Migration[6.0]
  def change
    remove_column :shares, :amount
    add_monetize :shares, :amount, currency: { present: false }
  end
end
