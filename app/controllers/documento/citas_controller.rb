class Documento::CitasController < ApplicationController
  before_action :set_cita, only: %i[ show edit update destroy ]

  # GET /citas or /citas.json
  def index
    @coleccion = Cita.all
  end

  # GET /citas/1 or /citas/1.json
  def show
  end

  # GET /citas/new
  def new
    @objeto = Cita.new
  end

  # GET /citas/1/edit
  def edit
  end

  # POST /citas or /citas.json
  def create
    @objeto = Cita.new(cita_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Cita was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citas/1 or /citas/1.json
  def update
    respond_to do |format|
      if @objeto.update(cita_params)
        format.html { redirect_to @objeto, notice: "Cita was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citas/1 or /citas/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to citas_url, notice: "Cita was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cita
      @objeto = Cita.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cita_params
      params.require(:cita).permit(:referencia_base_id, :documento_base_id)
    end
end
