class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.integer :employees_salray
      t.integer :ptcl_bill
      t.integer :electricity_bill
      t.integer :office_rent
      t.integer :motorcycle_petrol
      t.integer :car_petrol
      t.integer :office_lunch
      t.integer :guests_entertainment
      t.integer :office_stationary
      t.integer :office_renovation
      t.integer :cable_fee
      t.integer :office_licenses_maintenance
      t.string :fbr_returns
      t.string :other_expenses_detail
      t.integer :other_expenses

      t.timestamps
    end
  end
end
