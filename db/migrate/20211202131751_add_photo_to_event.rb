class AddPhotoToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :photo, :string
  end
end
