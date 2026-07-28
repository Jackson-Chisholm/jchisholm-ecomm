class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.string :status

      t.timestamps
    end
  end
end
