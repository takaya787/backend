class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :reason
      t.integer :duration
      t.text :advice
      t.text :food
      t.text :convenient
      t.string :favorite
      t.float :score
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
