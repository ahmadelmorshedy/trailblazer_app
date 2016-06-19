class Catalog < ActiveRecord::Base
	class Create < Trailblazer::Operation

		# process method is called when Operation is run
		# it takes params as a parameter
		def process(params)
			puts "Hassanein: #{params.inspect}"
			@model = Catalog.new(name: params[:name])
			# x = y + 4
			@model.save
		end
	end
end