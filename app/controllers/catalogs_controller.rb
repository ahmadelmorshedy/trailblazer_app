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

  # POST /catalogs
  # POST /catalogs.json
  def create
    result, op = Catalog::Create.run(params[:catalog]) # run Catalog::Create
    respond_to do |format|
      if result
      	@catalog = op.model
        format.html { redirect_to @catalog, notice: 'Catalog was successfully created.' }
        format.json { render :show, status: :created, location: @catalog }
      else
        format.html { render :new }
        format.json { render json: op.errors, status: :unprocessable_entity }
      end
    end
  end
end