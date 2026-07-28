class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :email
      t.integer :phone
      t.string :password

      t.timestamps
    end
  end
end
