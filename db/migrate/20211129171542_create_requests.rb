class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :status
      t.references :requester, null: false, foreign_key: { to_table: 'bookings' }
      t.references :requestee, null: false, foreign_key: { to_table: 'bookings' }

      t.timestamps
    end
  end
end
