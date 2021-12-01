class ChangeRequestsStatusToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :requests, :status, :integer, null: false, default: 1,
                                                using: 'status::integer'
  end
end
