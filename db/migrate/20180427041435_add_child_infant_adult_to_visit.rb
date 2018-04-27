class AddChildInfantAdultToVisit < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :adult, :integer
    add_column :visits, :child, :integer
    add_column :visits, :infant, :integer
  end
end
