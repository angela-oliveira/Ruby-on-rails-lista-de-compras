class ListaController < ApplicationController
  before_action :set_listum, only: %i[ show edit update destroy ]

  # GET /lista or /lista.json
  def index
    @lista = Listum.all
  end

  # GET /lista/1 or /lista/1.json
  def show
  end

  # GET /lista/new
  def new
    @listum = Listum.new
  end

  # GET /lista/1/edit
  def edit
  end

  # POST /lista or /lista.json
  def create
    @listum = Listum.new(listum_params)

    respond_to do |format|
      if @listum.save
        format.html { redirect_to @listum, notice: "Listum was successfully created." }
        format.json { render :show, status: :created, location: @listum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lista/1 or /lista/1.json
  def update
    respond_to do |format|
      if @listum.update(listum_params)
        format.html { redirect_to @listum, notice: "Listum was successfully updated." }
        format.json { render :show, status: :ok, location: @listum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lista/1 or /lista/1.json
  def destroy
    @listum.destroy
    respond_to do |format|
      format.html { redirect_to lista_url, notice: "Listum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listum
      @listum = Listum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listum_params
      params.require(:listum).permit(:nome)
    end
end
