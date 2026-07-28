class CreateProvinces < ActiveRecord::Migration[8.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.string :tax
      t.string :float

      t.timestamps
    end
  end
end
