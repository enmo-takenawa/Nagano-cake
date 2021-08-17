class CreateAdministratos < ActiveRecord::Migration[5.2]
  def change
    create_table :administratos do |t|
      t.string :admin_email
      t.string :admin_pass

      t.timestamps
    end
  end
end
