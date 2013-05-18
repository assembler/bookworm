class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.references :user
      t.references :book
      t.integer :rating
      t.timestamps
    end
    add_index :readings, :user_id
    add_index :readings, :book_id
  end
end
