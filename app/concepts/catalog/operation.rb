class Catalog < ActiveRecord::Base
	class Create < Trailblazer::Operation

		# process method is called when Operation is run
		# it takes params as a parameter
		def process(params)
			# Here I've just called the new method to create a new Catalog
			# it's not the best practice using trailblazer as we'll see later :D 
			@model = Catalog.new(name: params[:name])
			@model.save
		end
	end

	class Update  < Trailblazer::Operation
		# Here i'll implement the Update Class from scratch, better is to use inheritance
		# and inherit from Create class (implemented further)
		def process(params)
			# find catalog per id
			@model = Catalog.find(params[:id].to_i)
			# update it
			@model.update(name: params[:catalog][:name])
		end
	end
end