class DocsBase::AreaBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_area_base, only: %i[ show edit update destroy ]

  # GET /area_bases or /area_bases.json
  def index
    @coleccion = {}
    @coleccion['area_bases'] = AreaBase.all.order(:orden)
  end

  # GET /area_bases/1 or /area_bases/1.json
  def show
    @coleccion = {}
    @coleccion['documento_bases'] = @objeto.documento_bases.order(:documento_base)
  end

  # GET /area_bases/new
  def new
    @objeto = AreaBase.new
  end

  # GET /area_bases/1/edit
  def edit
  end

  # POST /area_bases or /area_bases.json
  def create
    @objeto = AreaBase.new(area_base_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Area base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_bases/1 or /area_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(area_base_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Area base was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_bases/1 or /area_bases/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Area base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_base
      @objeto = AreaBase.find(params[:id])
    end

    def set_redireccion
      @redireccion = estructuras_path
    end

    # Only allow a list of trusted parameters through.
    def area_base_params
      params.require(:area_base).permit(:orden, :area_base)
    end
end
