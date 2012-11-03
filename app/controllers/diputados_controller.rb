#encoding:utf-8
class DiputadosController < ApplicationController

	def index
		@diputados = Legislador.where(:es_diputado => true).order(:apellido, :nombre)
		@titulo ="Listado histórico"
	end #index

	def actuales
		@diputados = Legislador.where(:es_diputado => true, :actual => true).order(:apellido, :nombre)
		@titulo = "Diputados actuales"
		render :action => "index"
	end #actual

	def ficha
		@diputado = Legislador.find(params[:id])

	end #ficha

	def por_bloque
		@bloques = Bloque.order(:nombre)
	end #por_bloque


end
