class AddRemainingAmountAndActualCostCreditAmountPhoneToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :paidAmount, :integer
    add_column :companies, :creditAmount, :integer
    add_column :companies, :debitAmount, :integer
    add_column :companies, :actualCost, :integer
    add_column :companies, :salePrice, :integer
    add_column :companies, :profit, :integer
  end
end
