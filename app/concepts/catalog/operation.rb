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
end