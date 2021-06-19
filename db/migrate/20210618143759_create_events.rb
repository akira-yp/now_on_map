class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.text :official_page
      t.text :image
      t.string :location, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
