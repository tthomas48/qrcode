class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :label
      t.string :url
      t.string :image
      t.references :menu

      t.timestamps
    end
    add_index :menu_items, :menu_id
  end
end
