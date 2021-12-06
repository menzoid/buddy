class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :username
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :phone_number

      t.timestamps
    end
  end
end
