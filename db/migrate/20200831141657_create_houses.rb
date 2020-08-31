class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.integer :house_balance
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
