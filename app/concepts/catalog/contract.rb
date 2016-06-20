require "reform/form/validation/unique_validator.rb" #added with contract definition

# Contracts can be defined and implemented within the operation class/namespace 
# or defined in separate files 

module Catalog::Contract
	# Define A Class that will be used as a Base Class or abstract class to 
	# its children
	class Base < Reform::Form
		# the Base class should inherit from Reform::Form. 

		model Catalog
		property :name

		validates :name, unique: true, length: { minimum: 6 }
	end

	# Next I can add the Create Contract:
	class Create < Base
		# We Can here Add any validation rules specific to Create operation
		# Even if this class is empty, I think it's a good practice to use this 
		# architecture in building contracts
	end

	class Update < Base
	end
end