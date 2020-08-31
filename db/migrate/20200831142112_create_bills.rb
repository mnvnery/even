class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.references :house, null: false, foreign_key: true
      t.integer :amount
      t.date :due_date
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
