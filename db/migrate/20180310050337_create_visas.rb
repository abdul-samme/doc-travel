class CreateVisas < ActiveRecord::Migration[5.0]
  def change
    create_table :visas do |t|

      t.timestamps
    end
  end
end
