class Documento::DocumentoBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_documento_base, only: %i[ show edit update destroy ]

  # GET /documento_bases or /documento_bases.json
  def index
    areas_base = AreaBase.all.order(:orden)
    @list_selector = areas_base.map {|area| [area.area_base, area.documento_bases.count]}

    area_base = params[:html_options].blank? ? areas_base.first : (params[:html_options]['sel'].blank? ? areas_base.first : AreaBase.find_by(area_base: params[:html_options]['sel']))

    @sel = area_base.area_base
    @options = {'sel' => @sel}

    @coleccion = {}
    @coleccion[controller_name] = area_base.documento_bases.order(:orden)
  end

  # GET /documento_bases/1 or /documento_bases/1.json
  def show
    @asignatura_bases_seleccion = AsignaturaBase.where(id: (AsignaturaBase.all.ids - @objeto.asignatura_bases.ids))

    @coleccion = {}
    @coleccion['asignatura_bases'] = @objeto.asignatura_bases.order(:asignatura_base)
  end

  # GET /documento_bases/new
  def new
    @objeto = DocumentoBase.new
  end

  # GET /documento_bases/1/edit
  def edit
    @area_bases_select = AreaBase.all.order(:orden)
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
      params.require(:documento_base).permit(:orden, :documento_base, :area_base_id, :link)
    end
end
