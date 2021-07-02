class CreateHashtagings < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtagings do |t|
      t.references :event, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
