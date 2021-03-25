class DocsBase::EstructurasController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_estructura, only: %i[ show edit update destroy ]

  # GET /estructuras or /estructuras.json
  def index

    curriculum_base_w_default = CurriculumBase.all.empty? ? 'vacio' : CurriculumBase.all.order(:orden).first.curriculum_base

    if params[:html_options].blank?
      @tab = curriculum_base_w_default
    else
      @tab = params[:html_options][:tab].blank? ? curriculum_base_w_default : params[:html_options][:tab]
    end
    @options = {'tab' => @tab}

    @curriculum_base = CurriculumBase.find_by(curriculum_base: @tab)

    @coleccion = {}
    @coleccion['curriculum_bases'] = CurriculumBase.all.order(:orden)
    @coleccion['area_bases']       = AreaBase.all.order(:orden)
    @coleccion['nivel_bases']      = @curriculum_base.blank? ? nil : @curriculum_base.nivel_bases.order(:orden)
    @coleccion['asignatura_bases'] = @curriculum_base.blank? ? nil : @curriculum_base.asignatura_bases.order(:asignatura_base)
  end

  # GET /estructuras/1 or /estructuras/1.json
  def show
  end

  # GET /estructuras/new
  def new
    @objeto = Estructura.new
  end

  # GET /estructuras/1/edit
  def edit
  end

  # POST /estructuras or /estructuras.json
  def create
    @objeto = Estructura.new(estructura_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Estructura was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estructuras/1 or /estructuras/1.json
  def update
    respond_to do |format|
      if @objeto.update(estructura_params)
        format.html { redirect_to @objeto, notice: "Estructura was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estructuras/1 or /estructuras/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to estructuras_url, notice: "Estructura was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estructura
      @objeto = Estructura.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def estructura_params
      params.fetch(:estructura, {})
    end
end
