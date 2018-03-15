class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.string :visaWith
      t.string :countryCode
      t.integer :paidAmount
      t.integer :creditAmount
      t.integer :debitAmount
      t.integer :actualCost

      t.timestamps
    end
  end
end
