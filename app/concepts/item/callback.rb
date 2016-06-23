module Item::Callback
	class ItemSave < Disposable::Callback::Group
		# We have two Choices:
		# 	either inheriting from Disposable::Callback::Group
		# 	or implement a custom callback, by implementing
		# 	initialize(contract) that receives the contract, and 
		# 	call(options) that it have to respond to
		on_change :update_catalog
		# after_save :update_catalog # 2allak undefined method after_save
		# before_save :update_catalog # 2allak undefined method before_save
		# TODO >> if item changes catalog, or it was deleted mathalan :/, 
		# total items will change

		def update_catalog(item, *)
			# get catalog
			item_cat = item.model.catalog
			# set total items
			item_cat.total_items  = item_cat.items.count
			# set total and average costs
			cost = 0.0
			item_cat.items.each do |i|
				cost += i.price
			end
			item_cat.total_cost = cost
			item_cat.avg_cost = cost/item_cat.items.count
			item_cat.save
		end
	end
end