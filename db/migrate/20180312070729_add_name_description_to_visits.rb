class AddNameDescriptionToVisits < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :name, :string
    add_column :visits, :description, :text
  end
end
