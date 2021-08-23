class RenameGoodsIdColumnToOrderedGoods < ActiveRecord::Migration[5.2]
  def change
    rename_column :ordered_goods, :goods_id, :good_id
  end
end
