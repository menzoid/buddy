class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.text :intention_description
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :intention, null: false, foreign_key: true

      t.timestamps
    end
  end
end
