class Estructura::AsignaturaNivelBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_asignatura_nivel_base, only: %i[ show edit update destroy elimina_asignatura_nivel_base ]

  # GET /asignatura_nivel_bases or /asignatura_nivel_bases.json
  def index
    @tabs = CurriculumBase.all.order(:orden).map {|cb| cb.curriculum_base}
    if params[:html_options].blank?
      @tab = CurriculumBase.all.order(:orden).first.curriculum_base
      @sel = CurriculumBase.all.order(:orden).first.nivel_bases.order(:orden).first.nivel_base
      curriculum_base = CurriculumBase.all.order(:orden).first
      nivel_base = CurriculumBase.all.order(:orden).first.nivel_bases.order(:orden).first
    else
      @tab = (params[:html_options][:tab].blank? ? CurriculumBase.all.order(:orden).first.curriculum_base : params[:html_options][:tab] )
      @sel = (params[:html_options][:sel].blank? ? CurriculumBase.all.order(:orden).first.nivel_bases.order(:orden).first.nivel_base : params[:html_options][:sel] )

      curriculum_base = CurriculumBase.find_by(curriculum_base: @tab)
      unless curriculum_base.nivel_bases.order(:orden).map {|nb| nb.nivel_base}.include?(@sel)
        @sel = curriculum_base.nivel_bases.empty? ? '' : curriculum_base.nivel_bases.order(:orden).first.nivel_base
      end
      nivel_base = NivelBase.find_by(nivel_base: @sel)
    end
    @options = {'tab' => @tab, 'sel' => @sel}
    @list_selector = (curriculum_base.nivel_bases.order(:orden).map {|nb| [nb.nivel_base, nb.n_anbs_con_herencia]})

    @coleccion = {}
    @coleccion['asignatura_nivel_bases_base'] = nivel_base.blank? ? [] : nivel_base.anbs_con_herencia('base')
    @coleccion['asignatura_nivel_bases_electivo'] = nivel_base.blank? ? [] : nivel_base.anbs_con_herencia('electivo')
    @coleccion['asignatura_nivel_bases_libre_disposicion'] = nivel_base.blank? ? [] : nivel_base.anbs_con_herencia('libre disposición')
  end

  # GET /asignatura_nivel_bases/1 or /asignatura_nivel_bases/1.json
  def show
  end

  # GET /asignatura_nivel_bases/new
  def new
    @objeto = AsignaturaNivelBase.new
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

  def elimina_asignatura_nivel_base
    asignatura_base = @objeto.asignatura_base
    @objeto.nivel_bases.delete_all
    @objeto.delete

    redirect_to asignatura_base
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
      params.require(:asignatura_nivel_base).permit(:asignatura_base_id)
    end
end
