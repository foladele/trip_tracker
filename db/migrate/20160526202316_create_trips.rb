class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.integer :distance
      t.string :date

      t.timestamps null: false
    end
  end
end
