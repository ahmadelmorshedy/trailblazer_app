class Catalog < ActiveRecord::Base
	class Create < Trailblazer::Operation
		# Setting the Model
		include Model;
		model Catalog, :create 
		# This simply means the Operation will instantiate the correct class 
		# automatically (the .new instantiation)

		# Setting the contract
		contract Catalog::Contract::Create
		# process method is called when Operation is run
		# it takes params as a parameter
		def process(params)
			# Validate and saves the new catalog
			# Note that validation is separated in a contract object which
			# definition and implementation can be included in the operation 
			# class or in a separate contract file/module and referenced here
			validate(params[:catalog].to_hash) do |c|
				# validate uses the contract to validate catalog data
				# if validation passes only, the block will be executed
				c.save
			end
		end
	end

	class Show < Trailblazer::Operation
		include Model
    	model Catalog, :find
	end

	class Update  < Trailblazer::Operation
		# Here i'll implement the Update Class from scratch, better is to use 
		# inheritance and inherit from Create class (implemented further)

		# Setting the Model
		include Model;
		model Catalog, :update 
		# Setting the Contract
		contract Catalog::Contract::Update

		def process(params)
			# let's give it a try... experiment 0001/2016
			validate(params[:catalog].to_hash) do |c|
				c.save
			end
		end
	end

	class Destroy < Trailblazer::Operation
		# did not find corresponding model method, tried delete, destroy, remove
		# anyway, you still can put you still can write your own business logic

		# UPDATE >> you can override model! method, and use present instead of run
		def process(params)
			@model = Catalog.find(params[:id].to_i)
			@model.destroy
		end
	end

	class Index < Trailblazer::Operation
		include Collection

		def model!(params)
			Catalog.all # This will set the @model instance variable to your collection.
		end
	end
end