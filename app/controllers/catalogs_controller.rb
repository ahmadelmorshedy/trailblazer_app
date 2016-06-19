class CatalogsController < ApplicationController
  # GET /catalogs/new
  def new
  	@catalog = Catalog.new
  end

  # GET /catalogs/:id
  # GET /catalogs/:id.json
  def show
    @catalog = Catalog.find(params[:id])
  end

  # GET /catalogs/:id/edit
  def edit
    @catalog = Catalog.find(params[:id])
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    # Controllers, following Trailblazer philosophy/architecture, should be treated as 
    # HTTP lean points, responsible for getting the HTTP request, and calling the 
    # corresponding ooperation, it should have minimal business logic, the business  logic
    # is moved to the operation
    result, op = Catalog::Create.run(params[:catalog]) # run Catalog::Create
    # I've used .run form to call the operation, .run has two return values, the 'result' carries
    # wether the operation was successful (true) or not, and 'op' carries the operation object

    # next, we'll render corresponding view
    respond_to do |format|
      if result
      	@catalog = op.model # use op.model to get the model created
        format.html { redirect_to @catalog, notice: 'Catalog was successfully created.' }
        format.json { render :show, status: :created, location: @catalog }
      else
        format.html { render :new }
        format.json { render json: op.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogs/1
  # PATCH/PUT /catalogs/1.json
  def update
    result, op = Catalog::Update.run(params)
    respond_to do |format|
      if result
        @catalog = op.model
        format.html { redirect_to @catalog, notice: 'Catalog was successfully updated.' }
        format.json { render :show, status: :ok, location: @catalog }
      else
        format.html { render :edit }
        format.json { render json: op.errors, status: :unprocessable_entity }
      end
    end
  end
end