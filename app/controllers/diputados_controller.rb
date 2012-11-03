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

		# ordenar por cantidad 
		#@bloques = @bloques.sort_by{ |x| x.legisladors.size }

		if params[:historico]
			@titulo = "Listado Histórico de Diputados por bloque"
		else
			@titulo = "Diputados actuales por bloque"
		end
	end #por_bloque


end
