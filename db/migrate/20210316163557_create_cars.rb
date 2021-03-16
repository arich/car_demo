class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.references :brand
      t.integer :year
      t.timestamps
    end
  end
end
