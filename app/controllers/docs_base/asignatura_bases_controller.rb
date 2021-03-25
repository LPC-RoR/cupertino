class DocsBase::AsignaturaBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_asignatura_base, only: %i[ show edit update destroy desasignar ]

  # GET /asignatura_bases or /asignatura_bases.json
  def index
    @coleccion = AsignaturaBase.all
  end

  # GET /asignatura_bases/1 or /asignatura_bases/1.json
  def show
    @nivel_bases_seleccion = NivelBase.where(id: (NivelBase.all.ids - @objeto.nivel_bases.ids)).order(:orden)
    @documento_bases_seleccion = DocumentoBase.where(id: (DocumentoBase.all.ids - @objeto.documento_bases.ids)).order(:documento_base)

    @coleccion = {}
    @coleccion['nivel_bases'] = @objeto.nivel_bases.order(:orden)
    @coleccion['documento_bases'] = @objeto.documento_bases.order(:documento_base)
  end

  # GET /asignatura_bases/new
  def new
    @objeto = AsignaturaBase.new
  end

  # GET /asignatura_bases/1/edit
  def edit
  end

  # POST /asignatura_bases or /asignatura_bases.json
  def create
    @objeto = AsignaturaBase.new(asignatura_base_params)

    respond_to do |format|
      if @objeto.save
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Asignatura base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asignatura_bases/1 or /asignatura_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(asignatura_base_params)
        set_redireccion
        format.html { redirect_to @redireccion, notice: "Asignatura base was successfully updated." }
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
    end

    unless params[:objeto_base][:objeto_id].blank?
      nuevo_elemento = AsignaturaBase.find(params[:objeto_base][:objeto_id])
      @objeto.asignatura_bases << nuevo_elemento
    end

    redirect_to @objeto
  end

  def desasignar
    case params[:class_name]
    when 'DocumentoBase'
      elemento = DocumentoBase.find(params[:objeto_id])
      @objeto.documento_bases.delete(elemento)
    when 'NivelBase'
      elemento = NivelBase.find(params[:objeto_id])
      @objeto.nivel_bases.delete(elemento)
    end

    redirect_to elemento
  end

  # DELETE /asignatura_bases/1 or /asignatura_bases/1.json
  def destroy
    set_redireccion
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to @redireccion, notice: "Asignatura base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asignatura_base
      @objeto = AsignaturaBase.find(params[:id])
    end

    def set_redireccion
      @redireccion = documento_bases_path
    end

    # Only allow a list of trusted parameters through.
    def asignatura_base_params
      params.require(:asignatura_base).permit(:asignatura_base, :detalle)
    end
end
