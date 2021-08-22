class AddPriceIncludingTaxToOrderedGood < ActiveRecord::Migration[5.2]
  def change
    add_column :ordered_goods, :price_include_tax, :integer
  end
end
