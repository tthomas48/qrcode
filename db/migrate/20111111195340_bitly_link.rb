class BitlyLink < ActiveRecord::Migration
  def up
    add_column :menus, :bitly_url, :string
    add_column :menu_items, :bitly_url, :string

  end

  def down
    remove_column :menus, :bitly_url
    remove_column :menu_items, :bitly_url
  end
end
