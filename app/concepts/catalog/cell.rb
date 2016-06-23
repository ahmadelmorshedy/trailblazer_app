# The cells gem is completely stand-alone and can be used without Trailblazer.

# A cell is an object that represent a fragment of your UI. 
# The scope of that fragment is up to you: it can embrace an entire page, 
# a single comment container in a thread or just an avatar image link.

# In other words: A cell is an object that can render a template.

# Cells are faster than ActionView. While exposing a better performance, 
# you step-wise encapsulate fragments into cell widgets and enforce interfaces.
# class Catalog::Cell < Cell::ViewModel # Template missing: view: `show.slim` prefixes: ["app/cells/catalog/"]
# changed Cell::ViewModel to Cell::Concept => # class Catalog::Cell < Cell::Concept # Template missing: view: `show.slim` prefixes: ["app/concepts/catalog/views"]
# removed cells-slim gem => # class Catalog::Cell < Cell::Concept # Template missing: view: `show.haml` prefixes: ["app/concepts/catalog/views"]
# removed cells-haml gem => # class Catalog::Cell < Cell::Concept # Template missing: view: `show.erb` prefixes: ["app/concepts/catalog/views"]
class Catalog::Cell < Cell::Concept # <= changed app/concepts/catalog/views/show.html.erb to app/concepts/catalog/views/show.erb
	# default method
	def show
		@catalog = @model
		render # renders app/concepts/catalog/views/show
	end

	private
	def model_links
		"#{link_to 'Edit', edit_catalog_path(@catalog)} | <td> #{link_to 'Destroy', @catalog, method: :delete, data: { confirm: 'Are you sure?' }} | #{link_to 'Back', catalogs_path}"
	end
end