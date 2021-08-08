class CreateMylocations < ActiveRecord::Migration[5.2]
  def change
    create_table :mylocations do |t|
      t.string :name, null: false
      t.text :my_address
      t.float :my_latitude, null: false
      t.float :my_longitude, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
