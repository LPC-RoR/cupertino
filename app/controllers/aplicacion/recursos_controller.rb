class Aplicacion::RecursosController < ApplicationController
  before_action :inicia_sesion
  before_action :carga_temas_ayuda
#  before_action :set_recurso, only: [:show, :edit, :update, :destroy]

  def home
    @coleccion = {}
    @coleccion['tema_ayudas'] = TemaAyuda.where(tipo: 'inicio').order(:orden)
  end

  def procesos
  #  NivelBase.delete_all
  #  Curriculum.delete_all

  anbs_ids = AsignaturaNivelBase.all.map {|anb| anb.id if anb.nivel_bases.count == 0}.compact
  anbs = AsignaturaNivelBase.where(id: anbs_ids)
  anbs.delete_all

  abs_ids = AsignaturaBase.all.map {|ab| ab.id if ab.asignatura_nivel_bases.count == 0}.compact
  abs = AsignaturaBase.where(id: abs_ids)
  abs.delete_all

    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
end
 