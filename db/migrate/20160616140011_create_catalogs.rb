class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :name, null: false
      t.integer :total_items, null: false, default: 0
      t.float :total_cost
      t.float :avg_cost

      t.timestamps null: false
    end
  end
end
