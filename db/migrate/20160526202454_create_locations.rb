class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :description
      t.belongs_to :trip

      t.timestamps null: false
    end
  end
end
