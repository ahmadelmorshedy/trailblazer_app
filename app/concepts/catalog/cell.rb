# The cells gem is completely stand-alone and can be used without Trailblazer.

# A cell is an object that represent a fragment of your UI. 
# The scope of that fragment is up to you: it can embrace an entire page, 
# a single comment container in a thread or just an avatar image link.

# In other words: A cell is an object that can render a template.

# Cells are faster than ActionView. While exposing a better performance, 
# you step-wise encapsulate fragments into cell widgets and enforce interfaces.

module Catalog::Cell
	class Show < Trailblazer::Cell
		# default method
		def show
			@catalog = @model
			render #renders app/concepts/catalog/view/show
		end

		private
		def model_links
			"#{link_to 'Edit', edit_catalog_path(@catalog)} | <td> #{link_to 'Destroy', @catalog, method: :delete, data: { confirm: 'Are you sure?' }} | #{link_to 'Back', catalogs_path}"
		end
	end
end