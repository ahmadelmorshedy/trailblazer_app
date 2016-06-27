# The cells gem is completely stand-alone and can be used without Trailblazer.

# A cell is an object that represent a fragment of your UI. 
# The scope of that fragment is up to you: it can embrace an entire page, 
# a single comment container in a thread or just an avatar image link.

# In other words: A cell is an object that can render a template.

# Cells are faster than ActionView. While exposing a better performance, 
# you step-wise encapsulate fragments into cell widgets and enforce interfaces.

# include ActionView::Helpers::FormHelper # https://github.com/apotonick/cells/issues/260

module Catalog::Cell #making it two nested modules made an error
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

	class New < Trailblazer::Cell
		# default method
		def show
			@form = @model
			render #renders app/concepts/catalog/view/show
		end

		private
		def back_link
			link_to 'Back', catalogs_path
		end

		def dom_class(record, prefix = nil)
			# https://github.com/apotonick/cells/issues/260
			ActionView::RecordIdentifier.dom_class(record, prefix)
		end

		def dom_id(record, prefix = nil)
			# https://github.com/apotonick/cells/issues/260
			ActionView::RecordIdentifier.dom_id(record, prefix)
		end
	end

	class Edit < New #introducing Inheritance :)
		private
		def show_link
			link_to 'Show', @form
		end
	end

	class Index < Trailblazer::Cell
		def show
			render
		end

		private
		def catalog_show_link
			link_to 'Show', @model
		end

		def catalog_edit_link
			link_to 'Edit', edit_catalog_path(@model)
		end

		def catalog_destroy_link
			link_to 'Destroy', @model, method: :delete, data: { confirm: 'Are you sure?' }
		end
	end
end