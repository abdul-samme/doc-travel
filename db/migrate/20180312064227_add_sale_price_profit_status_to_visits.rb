class AddSalePriceProfitStatusToVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :salePrice, :integer
    add_column :visits, :profit, :integer
    add_column :visits, :status, :string
  end
end
