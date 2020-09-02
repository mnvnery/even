class SetDefaultToHouseBalance < ActiveRecord::Migration[6.0]
  def change
    change_column :houses, :house_balance, :integer, default: 0
  end
end
