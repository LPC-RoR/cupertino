class Estructura::CurriculumBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_curriculum_base, only: %i[ show edit update destroy ]

  # GET /curriculum_bases or /curriculum_bases.json
  def index
    @coleccion = CurriculumBase.all
  end

  # GET /curriculum_bases/1 or /curriculum_bases/1.json
  def show
    @nivel_bases_seleccion = NivelBase.where(curriculum_base_id: nil).order(:orden)
    @asignatura_bases_seleccion = AsignaturaBase.where(curriculum_base_id: nil).order(:asignatura_base)

    @coleccion = {}
    @coleccion['nivel_bases'] = @objeto.nivel_bases.order(:orden)
    @coleccion['tipo_asignatura_bases'] = @objeto.tipo_asignatura_bases.order(:orden)
    @coleccion['asignatura_bases'] = @objeto.asignatura_bases.order(:asignatura_base)
  end

  # GET /curriculum_bases/new
  def new
    @objeto = CurriculumBase.new
  end

  # GET /curriculum_bases/1/edit
  def edit
  end

  # POST /curriculum_bases or /curriculum_bases.json
  def create
    @objeto = CurriculumBase.new(curriculum_base_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Curriculum base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculum_bases/1 or /curriculum_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(curriculum_base_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Curriculum base was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculum_bases/1 or /curriculum_bases/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Curriculum base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum_base
      @objeto = CurriculumBase.find(params[:id])
    end

    def set_redireccion
      @redireccion = estructuras_path
    end

    # Only allow a list of trusted parameters through.
    def curriculum_base_params
      params.require(:curriculum_base).permit(:orden, :curriculum_base)
    end
end
