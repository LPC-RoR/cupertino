class DocsBase::DocumentoBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_documento_base, only: %i[ show edit update destroy ]

  # GET /documento_bases or /documento_bases.json
  def index
    @coleccion = {}
    @coleccion['area_bases']       = AreaBase.all.order(:orden)
    @coleccion['nivel_bases']      = NivelBase.all.order(:orden)
    @coleccion['documento_bases']  = DocumentoBase.all.order(:orden)
    @coleccion['asignatura_bases'] = AsignaturaBase.all.order(:asignatura_base)
  end

  # GET /documento_bases/1 or /documento_bases/1.json
  def show
  end

  # GET /documento_bases/new
  def new
    @objeto = DocumentoBase.new
  end

  # GET /documento_bases/1/edit
  def edit
  end

  # POST /documento_bases or /documento_bases.json
  def create
    @objeto = DocumentoBase.new(documento_base_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Documento base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documento_bases/1 or /documento_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(documento_base_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Documento base was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documento_bases/1 or /documento_bases/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Documento base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento_base
      @objeto = DocumentoBase.find(params[:id])
    end

    def set_redireccion
      @redireccion = documento_bases_path
    end

    # Only allow a list of trusted parameters through.
    def documento_base_params
      params.require(:documento_base).permit(:orden, :documento, :area_base_id)
    end
end
