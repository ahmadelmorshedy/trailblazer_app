class Item < ActiveRecord::Base
	belongs_to :catalog
	belongs_to :user
end
