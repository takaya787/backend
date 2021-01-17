class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.float :lat
      t.float :lng
      t.text :address
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
