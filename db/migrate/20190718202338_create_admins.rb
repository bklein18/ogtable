class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
    add_index :admin, :user_id
    add_index :admin, :group_id
    add_index :admin, [:user_id, :group_id], unique: true
  end
end
