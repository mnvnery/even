class CreateShares < ActiveRecord::Migration[6.0]
  def change
    create_table :shares do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true
      t.integer :amount
      t.boolean :paid

      t.timestamps
    end
  end
end
