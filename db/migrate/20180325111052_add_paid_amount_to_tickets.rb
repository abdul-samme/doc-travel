class AddPaidAmountToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :paidAmount, :integer
  end
end
