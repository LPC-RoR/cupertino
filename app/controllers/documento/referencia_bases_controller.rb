class Documento::ReferenciaBasesController < ApplicationController
  before_action :set_referencia_base, only: %i[ show edit update destroy ]

  # GET /referencia_bases or /referencia_bases.json
  def index
    @coleccion = ReferenciaBase.all
  end

  # GET /referencia_bases/1 or /referencia_bases/1.json
  def show
  end

  # GET /referencia_bases/new
  def new
    @objeto = ReferenciaBase.new
  end

  # GET /referencia_bases/1/edit
  def edit
  end

  # POST /referencia_bases or /referencia_bases.json
  def create
    @objeto = ReferenciaBase.new(referencia_base_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Referencia base was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referencia_bases/1 or /referencia_bases/1.json
  def update
    respond_to do |format|
      if @objeto.update(referencia_base_params)
        format.html { redirect_to @objeto, notice: "Referencia base was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referencia_bases/1 or /referencia_bases/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to referencia_bases_url, notice: "Referencia base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referencia_base
      @objeto = ReferenciaBase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def referencia_base_params
      params.require(:referencia_base).permit(:referencia_base, :tipo_referencia_base_id, :seccion, :clave)
    end
end
