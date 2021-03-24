class DocsBase::NivelBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_nivel_base, only: %i[ show edit update destroy elimina_nivel_base ]

  # GET /nivel_bases or /nivel_bases.json
  def index
    @coleccion = NivelBase.all
  end

  # GET /nivel_bases/1 or /nivel_bases/1.json
  def show
    @coleccion = {}
    @coleccion['nivel_bases'] = @objeto.children
    @coleccion['asignatura_bases'] = @objeto.asignatura_bases.order(:asignatura_base)
    @coleccion['documento_bases'] = @objeto.documento_bases.order(:documento_base)
  end

  # GET /nivel_bases/new
  def new
    @objeto = NivelBase.new
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
    when 'AsignaturaBase'
      @objeto = AsignaturaBase.find(params[:obj_id1])
      unless params[:objeto_base][:objeto_id].blank?
        nivel_base = NivelBase.find(params[:objeto_base][:objeto_id])
        @objeto.nivel_bases << nivel_base
      end
    end
    redirect_to @objeto
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

    redirect_to documento_bases_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nivel_base
      @objeto = NivelBase.find(params[:id])
    end

    def set_redireccion
      @redireccion = documento_bases_path
    end

    # Only allow a list of trusted parameters through.
    def nivel_base_params
      params.require(:nivel_base).permit(:orden, :nivel_base, :primer_nivel)
    end
end