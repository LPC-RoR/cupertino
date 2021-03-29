class Estructura::RequisitosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_requisito, only: %i[ show edit update destroy ]

  # GET /requisitos or /requisitos.json
  def index
    @coleccion = Requisito.all
  end

  # GET /requisitos/1 or /requisitos/1.json
  def show
  end

  # GET /requisitos/new
  def new
    @objeto = Requisito.new
  end

  # GET /requisitos/1/edit
  def edit
  end

  # POST /requisitos or /requisitos.json
  def create
    @objeto = Requisito.new(requisito_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Requisito was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requisitos/1 or /requisitos/1.json
  def update
    respond_to do |format|
      if @objeto.update(requisito_params)
        format.html { redirect_to @objeto, notice: "Requisito was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requisitos/1 or /requisitos/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to requisitos_url, notice: "Requisito was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requisito
      @objeto = Requisito.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def requisito_params
      params.require(:requisito).permit(:parent_id, :child_id)
    end
end
