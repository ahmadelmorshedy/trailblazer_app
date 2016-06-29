class Item < ActiveRecord::Base
	class Create < Trailblazer::Operation
		# Setting Model
		include Model;
		model Item, :create
		# Setting Contract
		contract Item::Contract::Create

		#setting Policy
		include Trailblazer::Operation::Policy
		policy Item::Policy, :create? #this line runs the policy check before new action

		# Setting callback
		# no need to "include Dispatch", since it's included in the initializer
		callback :item_saved, Callback::ItemSave
		# there are several methods to perform callbacks
		# 	1. Define a method in operation file, and just call it
		# 		before/after saving the model
		# 	2. Set and Define callback/callback methods into operation file
		# 			include Dispatch
		# 			callback :after_save do
		# 				on_change :notify!
		# 			end
		# 		Then define method notify! into operation.rb file
		# 	3. Define callback methods and triggers into an external callback
		# 		file, and include it here by definition (that's the method used)

		def process(params)
			if policy.create? #TODO >> be sure what this do exactly, probably just an additional check after policy setting line
				validate(params[:item].to_hash) do |i|
					i.user_id = params[:current_user].id #set user_id
					i.save
					dispatch!(:item_saved)
				end
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

		# Setting callback
		# include Dispatch
		callback :item_saved, Callback::ItemSave

		def process(params)
			validate(params[:item].to_hash) do |i|
				i.save
				dispatch!(:item_saved)
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