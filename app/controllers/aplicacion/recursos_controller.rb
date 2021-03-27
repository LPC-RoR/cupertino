class Aplicacion::RecursosController < ApplicationController
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
#  before_action :set_recurso, only: [:show, :edit, :update, :destroy]

  def home
    @coleccion = {}
    @coleccion['tema_ayudas'] = TemaAyuda.where(tipo: 'inicio').order(:orden)
  end

  def procesos
    NivelBase.delete_all
    Curriculum.delete_all

    redirect_to root
  end

  private
    # Use callbacks to share common setup or constraints between actions.
end
 