class Item < ActiveRecord::Base
	class Create < Trailblazer::Operation

		def process(params)
			@model = Item.new(params[:item].to_hash)
			@model.save
		end
	end

	class Update  < Trailblazer::Operation
		def process(params)
			# find item per id
			@model = Item.find(params[:id].to_i)
			# update it
			@model.update(params[:item].to_hash)
		end
	end

	class Destroy < Trailblazer::Operation
		def process(params)
			@model = Item.find(params[:id].to_i)
			@model.destroy
		end
	end 
end