class Estructura::ItemBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_item_base, only: %i[ show edit update destroy ]

  # GET /item_bases or /item_bases.json
  def index
    @coleccion = ItemBase.all
  end

  # GET /item_bases/1 or /item_bases/1.json
  def show
  end

  # GET /item_bases/new
  def new
    @objeto = ItemBase.new(documento_base_id: params[:documento_base_id])
  end

  # GET /item_bases/1/edit
  def edit
  end

  # POST /item_bases or /item_bases.json
  def create
    @objeto = ItemBase.new(item_base_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Item base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_bases/1 or /item_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(item_base_params)
        format.html { redirect_to @objeto, notice: "Item base was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_bases/1 or /item_bases/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to item_bases_url, notice: "Item base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_base
      @objeto = ItemBase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_base_params
      params.require(:item_base).permit(:orden, :item_base, :pagina, :tipo, :documento_base_id)
    end
end
