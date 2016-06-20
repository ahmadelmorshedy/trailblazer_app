class Item < ActiveRecord::Base
	class Create < Trailblazer::Operation
		# Setting Model
		include Model;
		model Item, :create
		# Setting Contract
		contract Item::Contract::Create

		def process(params)
			validate(params[:item].to_hash) do |i|
				i.save
			end
		end
	end

	class Show < Trailblazer::Operation
		include Model
    	model Item, :find
	end

	class Update  < Trailblazer::Operation
		# Setting the Model
		include Model;
		model Item, :update 
		# Setting the Contract
		contract Item::Contract::Update

		def process(params)
			validate(params[:item].to_hash) do |i|
				i.save
			end
		end
	end

	class Destroy < Trailblazer::Operation
		def process(params)
			@model = Item.find(params[:id].to_i)
			@model.destroy
		end
	end

	class Index < Trailblazer::Operation
		include Collection

		def model!(params)
			Item.all # This will set the @model instance variable to your collection.
		end
	end
end