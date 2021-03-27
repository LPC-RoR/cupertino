class DocsBase::TipoAsignaturaBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_tipo_asignatura_base, only: %i[ show edit update destroy ]

  # GET /tipo_asignatura_bases or /tipo_asignatura_bases.json
  def index
    @coleccion = TipoAsignaturaBase.all
  end

  # GET /tipo_asignatura_bases/1 or /tipo_asignatura_bases/1.json
  def show
    @nivel_bases_seleccion = NivelBase.where(id: (@objeto.curriculum_base.nivel_bases.ids - @objeto.nivel_bases.ids)).order(:orden)

    @coleccion = {}
    @coleccion['asignatura_bases'] = @objeto.asignatura_bases.order(:asignatura_base)
    @coleccion['nivel_bases'] = @objeto.nivel_bases.order(:orden)
  end

  # GET /tipo_asignatura_bases/new
  def new
    @objeto = TipoAsignaturaBase.new(curriculum_base_id: params[:curriculum_base_id])
  end

  # GET /tipo_asignatura_bases/1/edit
  def edit
  end

  # POST /tipo_asignatura_bases or /tipo_asignatura_bases.json
  def create
    @objeto = TipoAsignaturaBase.new(tipo_asignatura_base_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Tipo asignatura base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_asignatura_bases/1 or /tipo_asignatura_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(tipo_asignatura_base_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Tipo asignatura base was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_asignatura_bases/1 or /tipo_asignatura_bases/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Tipo asignatura base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_asignatura_base
      @objeto = TipoAsignaturaBase.find(params[:id])
    end

    def set_redireccion
      @redireccion = @objeto.curriculum_base
    end

    # Only allow a list of trusted parameters through.
    def tipo_asignatura_base_params
      params.require(:tipo_asignatura_base).permit(:orden, :tipo_asignatura_base, :curriculum_base_id)
    end
end
