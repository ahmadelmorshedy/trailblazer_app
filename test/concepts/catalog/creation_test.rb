require "test_helper"

# Test Built Using MiniTest
 
class CatalogCreateTest < ActiveSupport::TestCase
	
	test "validation test" do
		res, op = Catalog::Create.run(catalog: {})
		# The res variable is a boolean that shows if the Operation ran successfully or not. 
		# The op variable is the Operation itself.
		assert_not(res)
		assert_includes(op.errors[:name],    "is too short (minimum is 6 characters)")
	end

	test "create catalog" do
		res, op = Catalog::Create.run(catalog: {name: "name longer than minimum"})

		assert(res)
		assert_instance_of(Catalog, op.model)
	end
end