class RenameLaseNameColumnToLastNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :last_name　, :last_name
    rename_column :customers, :first_name_kana　, :first_name_kana
  end
end
