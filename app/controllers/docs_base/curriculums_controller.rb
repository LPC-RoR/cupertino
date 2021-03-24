class DocsBase::CurriculumsController < ApplicationController
  before_action :authenticate_usuario!
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
  before_action :set_curriculum, only: %i[ show edit update destroy ]

  # GET /curriculums or /curriculums.json
  def index
    @coleccion = Curriculum.all
  end

  # GET /curriculums/1 or /curriculums/1.json
  def show
  end

  # GET /curriculums/new
  def new
    @objeto = Curriculum.new
  end

  # GET /curriculums/1/edit
  def edit
  end

  # POST /curriculums or /curriculums.json
  def create
    @objeto = Curriculum.new(curriculum_params)

    respond_to do |format|
      if @objeto.save
        format.html { redirect_to @objeto, notice: "Curriculum was successfully created." }
        format.json { render :show, status: :created, location: @objeto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculums/1 or /curriculums/1.json
  def update
    respond_to do |format|
      if @objeto.update(curriculum_params)
        format.html { redirect_to @objeto, notice: "Curriculum was successfully updated." }
        format.json { render :show, status: :ok, location: @objeto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @objeto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculums/1 or /curriculums/1.json
  def destroy
    @objeto.destroy
    respond_to do |format|
      format.html { redirect_to curriculums_url, notice: "Curriculum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @objeto = Curriculum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def curriculum_params
      params.require(:curriculum).permit(:nivel_base_id, :asignatura_base_id)
    end
end
