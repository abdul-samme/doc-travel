class AddQuantityToVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :quantity, :integer
  end
end
