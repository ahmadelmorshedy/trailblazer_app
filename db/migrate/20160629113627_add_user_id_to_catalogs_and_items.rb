class AddUserIdToCatalogsAndItems < ActiveRecord::Migration
  def change
  	add_column :catalogs, :user_id, :integer
  	add_column :items, :user_id, :integer
  end
end
