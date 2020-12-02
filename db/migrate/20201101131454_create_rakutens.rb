class CreateRakutens < ActiveRecord::Migration[5.2]
  def change
    create_table :rakutens do |t|
      t.date :day
      t.string :item
      t.text :memo
      t.integer :price
      t.integer :number

      t.timestamps
    end
  end
end
