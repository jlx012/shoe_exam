class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.decimal :price

      t.timestamps null: false
    end
  end
end
