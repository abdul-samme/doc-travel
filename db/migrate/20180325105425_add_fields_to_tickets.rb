class AddFieldsToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :name, :string
    add_column :tickets, :airline, :string
    add_column :tickets, :sector, :string
    add_column :tickets, :sale_price, :integer
    add_column :tickets, :actual_price, :integer
    add_column :tickets, :ticket_no, :string
    add_column :tickets, :airline_pnr, :string
    add_column :tickets, :gds_pnr, :string
    add_column :tickets, :from, :string
    add_column :tickets, :to, :string
    add_column :tickets, :adult, :integer
    add_column :tickets, :child, :integer
    add_column :tickets, :infant, :integer
    add_column :tickets, :quantity, :integer
    add_column :tickets, :creditAmount, :integer
    add_column :tickets, :debit, :integer
    add_column :tickets, :margin, :integer
    add_column :tickets, :status, :string
  end
end
