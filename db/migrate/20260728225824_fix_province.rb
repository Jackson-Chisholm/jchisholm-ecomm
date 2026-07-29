class FixProvince < ActiveRecord::Migration[8.1]
  def change
    change_column :provinces, :tax, :float
    remove_column :provinces, :float, :string
  end
end
