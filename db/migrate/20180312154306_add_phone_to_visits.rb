class AddPhoneToVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :phone, :string
  end
end
