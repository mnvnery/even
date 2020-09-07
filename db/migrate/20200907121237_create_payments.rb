class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :state
      t.monetize :even_amount
      t.string :checkout_session_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
