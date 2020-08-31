class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :house, null: false, foreign_key: true
      t.date :expiration
      t.text :description
      t.string :generated_link

      t.timestamps
    end
  end
end
