class ChangeDatatypeSalesStatusOfGoods < ActiveRecord::Migration[5.2]
  def change
    change_column :goods, :sales_status, :boolean, default: false
  end
end
