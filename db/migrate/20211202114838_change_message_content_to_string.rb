class ChangeMessageContentToString < ActiveRecord::Migration[6.1]
  def change
    change_column :messages, :content, :string, null: false
  end
end
