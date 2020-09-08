class AddPaidDateToShares < ActiveRecord::Migration[6.0]
  def change
    add_column :shares, :paid_date, :date
  end
end
