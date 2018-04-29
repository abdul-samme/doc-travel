class AddUserIdToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :user_id, :integer
    add_index :deals, :user_id
  end
end
