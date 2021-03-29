class Documento::TipoReferenciaBasesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_tipo_referencia_base, only: %i[ show edit update destroy ]

  # GET /tipo_referencia_bases or /tipo_referencia_bases.json
  def index
    @coleccion = TipoReferenciaBase.all
  end

  # GET /tipo_referencia_bases/1 or /tipo_referencia_bases/1.json
  def show
  end

  # GET /tipo_referencia_bases/new
  def new
    @objeto = TipoReferenciaBase.new
  end

  # GET /tipo_referencia_bases/1/edit
  def edit
  end

  # POST /tipo_referencia_bases or /tipo_referencia_bases.json
  def create
    @objeto = TipoReferenciaBase.new(tipo_referencia_base_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Tipo referencia base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_referencia_bases/1 or /tipo_referencia_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(tipo_referencia_base_params)
        format.html { redirect_to @objeto, notice: "Tipo referencia base was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_referencia_bases/1 or /tipo_referencia_bases/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to tipo_referencia_bases_url, notice: "Tipo referencia base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_referencia_base
      @objeto = TipoReferenciaBase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_referencia_base_params
      params.require(:tipo_referencia_base).permit(:orden, :tipo_referencia_base)
    end
end
