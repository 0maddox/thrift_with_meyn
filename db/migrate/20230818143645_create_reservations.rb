class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :clothing_item, null: false, foreign_key: true
      t.string :payment_status
      t.decimal :reserved_amount

      t.timestamps
    end
  end
end
