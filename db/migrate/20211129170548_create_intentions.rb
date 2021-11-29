class CreateIntentions < ActiveRecord::Migration[6.1]
  def change
    create_table :intentions do |t|
      t.string :name

      t.timestamps
    end
  end
end
