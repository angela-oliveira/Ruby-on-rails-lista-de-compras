class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find_by_id(params[:id])
  end

  # GET /items/new
  def new
    @lista = Listum.find(params[:listum_id])
    # @item = Item.new
    @item = @lista.items.build
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items or /items.json
  def create
    @lista = Listum.find(params[:listum_id])
    @item = @lista.items.create(item_params)
    # @item = Item.new(item_params)
    if @item.save
      redirect_to listum_path(@lista)
    else
      render 'new'
    # respond_to do |format|
    #   if @item.save
    #     format.html { redirect_to @item, notice: "Item was successfully created." }
    #     format.json { render :show, status: :created, location: @item }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @lista = Listum.find(params[:lista_id])
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      redirect_to listum_path(@lista)
    else
      render 'edit'
    end
    # respond_to do |format|
    #   if @item.update(item_params)
    #     format.html { redirect_to @item, notice: "Item was successfully updated." }
    #     format.json { render :show, status: :ok, location: @item }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @item.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @lista = Listum.find(params[:listum_id])
    @item = Item.find(params[:id])
    
    @item.destroy
    redirect_to listum_path(@lista)
    # respond_to do |format|
    #   format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:nome, :preco, :quantidade, :lista_id)
    end
end
