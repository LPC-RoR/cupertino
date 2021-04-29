class Estructura::ContenidoBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_contenido_base, only: %i[ show edit update destroy ]

  # GET /contenido_bases or /contenido_bases.json
  def index
    @coleccion = ContenidoBase.all
  end

  # GET /contenido_bases/1 or /contenido_bases/1.json
  def show
  end

  # GET /contenido_bases/new
  def new
    @objeto = ContenidoBase.new(asignatura_nivel_base_id: params[:asignatura_nivel_base_id])
  end

  # GET /contenido_bases/1/edit
  def edit
  end

  # POST /contenido_bases or /contenido_bases.json
  def create
    @objeto = ContenidoBase.new(contenido_base_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Contenido base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contenido_bases/1 or /contenido_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(contenido_base_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Contenido base was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contenido_bases/1 or /contenido_bases/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Contenido base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contenido_base
      @objeto = ContenidoBase.find(params[:id])
    end

    def set_redireccion
      @redireccion = @objeto.asignatura_nivel_base
    end

    # Only allow a list of trusted parameters through.
    def contenido_base_params
      params.require(:contenido_base).permit(:asignatura_nivel_base_id, :contenido_base)
    end
end
