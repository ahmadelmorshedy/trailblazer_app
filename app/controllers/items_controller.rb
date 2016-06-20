class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    present Item::Index
  end

  # GET /items/new
  def new
  	form Item::Create
  end

  # GET /items/:id
  # GET /items/:id.json
  def show
    @item_op = present Item::Show
    @item    = @item_op.model
  end

  # GET /items/:id/edit
  def edit
    form Item::Update
  end

  # POST /items
  # POST /items.json
  def create
    respond_to do |format|
      run Item::Create do |op|
        format.html { redirect_to op.model, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: op.model }
      end
      # next is executed if Item not created
      @form.prepopulate!
      format.html { render :new } #render action: :new
      format.json { render json: @form.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      run Item::Update do |op|
        format.html { redirect_to op.model, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: op.model }
      end

      format.html { render :edit }
      format.json { render json: @form.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /items/:id
  # DELETE /items/:id.json
  def destroy
    run Item::Destroy do
      respond_to do |format|
        format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end
end