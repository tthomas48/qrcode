class MenuUserReference < ActiveRecord::Migration
  def up
    add_column :menus, :user_id, :integer
  end

  def down
    remove_column :menu, :user_id
  end
end
