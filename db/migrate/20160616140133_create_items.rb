class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :description
      t.float :price, null: false, default: 0.0
      t.integer :catalog_id, null: false

      t.timestamps null: false
    end
  end
end
