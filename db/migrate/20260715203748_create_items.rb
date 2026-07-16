class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :franchise
      t.float :price
      t.integer :stock

      t.timestamps
    end
  end
end
