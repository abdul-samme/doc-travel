class AddVisaTypeDaysToVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :visaType, :string
    add_column :visits, :days, :string
  end
end
