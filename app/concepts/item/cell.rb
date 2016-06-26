include ActionView::Helpers::FormHelper # https://github.com/apotonick/cells/issues/260

include ActionView::Helpers::FormOptionsHelper # https://gitter.im/trailblazer/chat/archives/2016/02/11

module Item::Cell
	class BasicItemCell < Trailblazer::Cell
		# acting as an abstract class
		private
		def create_link
			link_to 'New Item', new_item_path
		end

		def show_link
			link_to 'Show', @model
		end

		def edit_link
			link_to 'Edit', edit_item_path(@model)
		end

		def destroy_link
			link_to 'Destroy', @model, method: :delete, data: { confirm: 'Are you sure?' }
		end

		def back_to_items
			link_to 'Back', items_path
		end
	end

	class Show < BasicItemCell
		def show
			@item = @model
			render
		end
	end

	class New < BasicItemCell
		def show
			@form = @model
			render
		end

		private
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
		# private
		# def show_link
		# 	link_to 'Show', @form
		# end
	end

	class Index < BasicItemCell
		# show is impelemented by default, no need to implement it for basic rendering
	end

	class IndexItem < BasicItemCell
	end
end