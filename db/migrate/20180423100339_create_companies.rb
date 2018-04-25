class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :visa_or_ticket
      t.string :bye_or_sell
      t.integer :amount
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
