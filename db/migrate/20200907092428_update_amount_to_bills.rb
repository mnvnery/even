class UpdateAmountToBills < ActiveRecord::Migration[6.0]
  def change
    remove_column :bills, :amount
    add_monetize :bills, :amount, currency: { present: false }
  end
end
