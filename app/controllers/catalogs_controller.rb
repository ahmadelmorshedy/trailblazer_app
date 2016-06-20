class CatalogsController < ApplicationController
  # GET /catalogs
  # GET /catalogs.json
  def index
    # since it's for now just a model selection, we can make it here without calling an 
    # operation, maybe it'll be changed further
    @catalogs = Catalog.all
  end

  # GET /catalogs/new
  def new
  	# introducing form
    form Catalog::Create # you need to update your views to use @form not @catalog
  end

  # GET /catalogs/:id
  # GET /catalogs/:id.json
  def show
    # introducing present
    @catalog_op = present Catalog::Show
    @catalog    = @catalog_op.model
  end

  # GET /catalogs/:id/edit
  def edit
    form Catalog::Update
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    # Controllers, following Trailblazer philosophy/architecture, should be treated as 
    # HTTP lean points, responsible for getting the HTTP request, and calling the 
    # corresponding ooperation, it should have minimal business logic, the business  logic
    # is moved to the operation

    respond_to do |format|
      run Catalog::Create do |op|
        format.html { redirect_to op.model, notice: 'Catalog was successfully created.' }
        format.json { render :show, status: :created, location: op.model }
      end
      # next is executed if Catalog not created
      @form.prepopulate!
      format.html { render :new } #render action: :new
      format.json { render json: @form.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /catalogs/1
  # PATCH/PUT /catalogs/1.json
  def update
    respond_to do |format|
      run Catalog::Update do |op|
        format.html { redirect_to op.model, notice: 'Catalog was successfully updated.' }
        format.json { render :show, status: :ok, location: op.model }
      end

      format.html { render :edit }
      format.json { render json: @form.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /catalogs/:id
  # DELETE /catalogs/:id.json
  def destroy
    run Catalog::Destroy do
      respond_to do |format|
        format.html { redirect_to catalogs_url, notice: 'Catalog was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end
end