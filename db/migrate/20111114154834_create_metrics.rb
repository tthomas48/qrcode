class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metric_dates do |t|
      t.timestamp :showdate
      t.references :menu

      t.timestamps
    end
    add_index :metric_dates, :menu_id
   
    create_table :metrics do |t|
      t.references :metric_date
      t.string :metric
      t.integer :quantity
 
      t.timestamps
    end
    add_index :metrics, :metric_date_id
  end
end
