require "reform/form/validation/unique_validator.rb" #added with contract definition

module Item::Contract
	# Define A Class that will be used as a Base Class or abstract class to its children
	class Base < Reform::Form
		# the Base class should inherit from Reform::Form. 

		model Item
		property :name
		property :price
		property :description 
		# without it, item create/edit form shows an error that:
		# undefined method `description' for #<#<Class:0x007f3ea86f4b98>:0x007f3eb835a838>
		property :catalog_id
		
		validates :name, unique: true, length: { minimum: 6 }
		validates :price, numericality: true
		validates :price, numericality: {greater_than: 0}
	end

	# Next I can add the Create Contract:
	class Create < Base
		validates :price, presence:true
	end

	class Update < Base
	end
end