class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/new
  def new
  	@item = Item.new
  end

  # GET /items/:id
  # GET /items/:id.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/:id/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    result, op = Item::Create.run(params) # run Item::Create
    
    # next, we'll render corresponding view
    respond_to do |format|
      if result
      	@item = op.model # use op.model to get the model created
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: op.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    result, op = Item::Update.run(params)
    respond_to do |format|
      if result
        @item = op.model
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: op.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/:id
  # DELETE /items/:id.json
  def destroy
    result, op = Item::Destroy.run(params)
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end