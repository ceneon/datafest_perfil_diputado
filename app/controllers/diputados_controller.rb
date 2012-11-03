class DiputadosController < ApplicationController

	def index

		@diputados = Legislador.where(:es_diputado => true).order(:apellido, :nombre)

	end #index

	def ficha
		@diputado = Legislador.find(params[:id])

	end #ficha

	def por_bloque
		@bloques = Bloque.order(:nombre)
	end #por_bloque


end
