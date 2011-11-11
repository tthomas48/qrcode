class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :label
      t.string :image

      t.timestamps
    end
  end
end
