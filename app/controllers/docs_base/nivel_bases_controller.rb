class DocsBase::NivelBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_nivel_base, only: %i[ show edit update destroy elimina_nivel_base desasignar ]

  # GET /nivel_bases or /nivel_bases.json
  def index
    @coleccion = NivelBase.all
  end

  # GET /nivel_bases/1 or /nivel_bases/1.json
  def show
    @nivel_bases_seleccion = NivelBase.where(id: (@objeto.curriculum_base.nivel_bases.ids - @objeto.children.ids)).order(:orden)

    @coleccion = {}
    @coleccion['nivel_bases'] = @objeto.children
    @coleccion['asignatura_nivel_bases'] = @objeto.asignatura_nivel_bases
    @coleccion['documento_bases'] = @objeto.documento_bases.order(:documento_base)
  end

  # GET /nivel_bases/new
  def new
    @objeto = NivelBase.new(curriculum_base_id: params[:curriculum_base_id])
  end

  def inline_nuevo
    @padre = NivelBase.find(params[:obj_id1])
    unless params[:nuevo_objeto][:orden].blank? or params[:nuevo_objeto][:objeto].blank?
      nuevo_obj = NivelBase.create(orden: params[:nuevo_objeto][:orden], nivel_base: params[:nuevo_objeto][:objeto])
      @padre.children << nuevo_obj
    end
    redirect_to @padre
  end

  # GET /nivel_bases/1/edit
  def edit
  end

  # POST /nivel_bases or /nivel_bases.json
  def create
    @objeto = NivelBase.new(nivel_base_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Nivel base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nivel_bases/1 or /nivel_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(nivel_base_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Nivel base was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  def asigna_select_elemento
    case params[:class_name1]
    when 'DocumentoBase'
      @objeto = DocumentoBase.find(params[:obj_id1])
    when 'TipoAsignaturaBase'
      @objeto = TipoAsignaturaBase.find(params[:obj_id1])
    when 'NivelBase'
      @objeto = NivelBase.find(params[:obj_id1])
    end

    unless params[:objeto_base][:objeto_id].blank?
      nivel_base = NivelBase.find(params[:objeto_base][:objeto_id])
      if params[:class_name1] == 'NivelBase'
        @objeto.children << nivel_base
      else
        @objeto.nivel_bases << nivel_base
      end
    end

    redirect_to @objeto
  end

  def desasignar
    case params[:class_name]
    when 'AsignaturaBase'
      elemento = AsignaturaBase.find(params[:objeto_id])
      @objeto.asignatura_bases.delete(elemento)
    when 'DocumentoBase'
      elemento = DocumentoBase.find(params[:objeto_id])
      @objeto.documento_bases.delete(elemento)
    when 'NivelBase'
      elemento = NivelBase.find(params[:objeto_id])
      elemento.children.delete(@objeto)
    when 'TipoAsignaturaBase'
      elemento = TipoAsignaturaBase.find(params[:objeto_id])
      @objeto.tipo_asignatura_bases.delete(elemento)
    end

    redirect_to elemento
  end

  def crea_asignatura_nivel
    asignatura_base = AsignaturaBase.find(params[:obj_id1])
    unless params[:objeto_base][:objeto_id].blank?
      nivel_base = NivelBase.find(params[:objeto_base][:objeto_id])

      case asignatura_base.alcance
      when 'nivel'
        se_procesa = (not asignatura_base.asignatura_nivel_bases.map {|anb| anb.nivel_bases.ids.include?(nivel_base.id)}.include?(true))
      when 'multinivel'
        se_procesa = (asignatura_base.asignatura_nivel_bases.empty? or (not asignatura_base.asignatura_nivel_bases.first.nivel_bases.ids.include?(nivel_base.id)))
      end

      if se_procesa
        if asignatura_base.alcance == 'multinivel' and asignatura_base.asignatura_nivel_bases.any?
          asignatura_nivel_base = asignatura_base.asignatura_nivel_bases.first
        else
          asignatura_nivel_base = asignatura_base.asignatura_nivel_bases.create()
        end
        asignatura_nivel_base.nivel_bases << nivel_base
      end
    end

    redirect_to asignatura_base
  end

  # DELETE /nivel_bases/1 or /nivel_bases/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Nivel base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def elimina_nivel_base
    padre = @objeto.parent
    
    padre.children.delete(@objeto) unless padre.blank?

    @objeto.delete

    redirect_to @objeto.curriculum_base
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nivel_base
      @objeto = NivelBase.find(params[:id])
    end

    def set_redireccion
      @redireccion = @objeto.curriculum_base
    end

    # Only allow a list of trusted parameters through.
    def nivel_base_params
      params.require(:nivel_base).permit(:orden, :nivel_base, :primer_nivel, :curriculum_base_id)
    end
end
