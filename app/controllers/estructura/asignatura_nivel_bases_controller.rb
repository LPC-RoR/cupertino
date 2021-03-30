class Estructura::AsignaturaNivelBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_asignatura_nivel_base, only: %i[ show edit update destroy ]

  # GET /asignatura_nivel_bases or /asignatura_nivel_bases.json
  def index
    @tabs = CurriculumBase.all.order(:orden).map {|cb| cb.curriculum_base}

    primer_curriculum = CurriculumBase.all.order(:orden).first
    primer_asignatura = primer_curriculum.asignatura_bases.order(:asignatura_base).first
    if params[:html_options].blank?
      @tab = primer_curriculum.curriculum_base
      curriculum_base = primer_curriculum
      @sel = primer_asignatura.asignatura_base
      asignatura_base = primer_asignatura
    else
      @tab = (params[:html_options][:tab].blank? ? primer_curriculum.curriculum_base : params[:html_options][:tab] )
      @sel = (params[:html_options][:sel].blank? ? primer_asignatura.asignatura_base : params[:html_options][:sel] )

      curriculum_base = CurriculumBase.find_by(curriculum_base: @tab)
      unless curriculum_base.asignatura_bases.order(:asignatura_base).map {|ab| ab.asignatura_base}.include?(@sel)
        @sel = curriculum_base.asignatura_bases.empty? ? '' : curriculum_base.asignatura_bases.order(:asignatura_base).first.asignatura_base
      end
      asignatura_base = AsignaturaBase.find_by(asignatura_base: @sel)
    end
    @options = {'tab' => @tab, 'sel' => @sel}
    puts "************************************************************* index"
    puts curriculum_base.class
    puts curriculum_base.id
    @list_selector = (curriculum_base.asignatura_bases.order(:asignatura_base).map {|ab| [ab.asignatura_base, ab.asignatura_nivel_bases.count]})

    @coleccion = {}
    @coleccion['asignatura_nivel_bases'] = asignatura_base.asignatura_nivel_bases.order(:created_at)
#    @coleccion['asignatura_nivel_bases_base'] = asignatura_base.blank? ? [] : asignatura_base.anbs_con_herencia('base')
#    @coleccion['asignatura_nivel_bases_electivo'] = asignatura_base.blank? ? [] : asignatura_base.anbs_con_herencia('electivo')
#    @coleccion['asignatura_nivel_bases_libre_disposicion'] = asignatura_base.blank? ? [] : asignatura_base.anbs_con_herencia('libre disposición')
  end

  # GET /asignatura_nivel_bases/1 or /asignatura_nivel_bases/1.json
  def show
    @nivel_bases_seleccion = NivelBase.all.order(:orden)
#    @documento_bases_seleccion = DocumentoBase.where(id: (@objeto.curriculum_base.documento_bases.ids - @objeto.documento_bases.ids)).order(:documento_base)

    @coleccion = {}
    @coleccion['documento_bases'] = @objeto.documento_bases.order(:documento_base)
    @coleccion['nivel_bases'] = @objeto.nivel_bases.order(:orden)
  end

  # GET /asignatura_nivel_bases/new
  def new
    origen = (session[:es_administrador] ? 'base' : 'usuario')
    @objeto = AsignaturaNivelBase.new(asignatura_base_id: params[:asignatura_base_id], origen: origen)
  end

  # GET /asignatura_nivel_bases/1/edit
  def edit
  end

  # POST /asignatura_nivel_bases or /asignatura_nivel_bases.json
  def create
    @objeto = AsignaturaNivelBase.new(asignatura_nivel_base_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Asignatura nivel base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignatura_nivel_bases/1 or /asignatura_nivel_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(asignatura_nivel_base_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Asignatura nivel base was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asignatura_nivel_bases/1 or /asignatura_nivel_bases/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Asignatura nivel base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignatura_nivel_base
      @objeto = AsignaturaNivelBase.find(params[:id])
    end

    def set_redireccion
      @redireccion = @objeto.asignatura_base
    end

    # Only allow a list of trusted parameters through.
    def asignatura_nivel_base_params
      params.require(:asignatura_nivel_base).permit(:tipo_asignatura_base_id, :asignatura_base_id, :origen, :tipo, :asignatura_nivel_base)
    end
end
