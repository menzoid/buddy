class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.text :description
      t.date :date
      t.time :time
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
