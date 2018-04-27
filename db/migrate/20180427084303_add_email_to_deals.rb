class AddEmailToDeals < ActiveRecord::Migration[5.0]
  def change
    add_column :deals, :email, :string
  end
end
